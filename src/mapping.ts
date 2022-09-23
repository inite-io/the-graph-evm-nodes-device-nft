import { bigInt, BigInt, json, JSONValue } from "@graphprotocol/graph-ts"
import {
  NFT,
  Approval,
  ApprovalForAll,
  Transfer,
  buyed
} from "../generated/NFT/NFT"
import { NFTToken, User } from "../generated/schema"

export function handleApproval(event: Approval): void {}

export function handleApprovalForAll(event: ApprovalForAll): void {}

export function handleTransfer(event: Transfer): void {
  let token = NFTToken.load(event.params.tokenId.toString());
  if (!token) {
    token = new NFTToken(event.params.tokenId.toString());
    
    let tokenContract = NFT.bind(event.address);
    const tokenInfo = tokenContract.getItemInfo(event.params.tokenId)[0];

    token.creator = tokenInfo.creator.toHexString();
    token.token_id = tokenInfo.tokenID;
    const owner = tokenContract.ownerOf(token.token_id);

    // when new token generated creator is owner
    token.owner = owner.toHexString();
    // initially token is on sale
  
    token.price = tokenContract.getItemInfo(event.params.tokenId)[0].price;
    token.json = tokenContract.getItemInfo(event.params.tokenId)[0].data;
    token.on_sale = tokenContract.getItemInfo(event.params.tokenId)[0].onSale;
    
    const data = json.fromString(tokenContract.getItemInfo(event.params.tokenId)[0].data);
    const title = data.toObject().get("title");
    if (title)  {
      token.title = title.toString();
    }

    const description = data.toObject().get("description");
    if (description) {
      token.description = description.toString();
    }

    const media = data.toObject().get("media");
    if (media) {
      token.media = media.toString();
    }

    token.last_change = event.block.timestamp;
  } else {
    let tokenContract = NFT.bind(event.address);
    const tokenInfo = tokenContract.getItemInfo(event.params.tokenId)[0];
    const owner = tokenContract.ownerOf(token.token_id);

    // when new token generated creator is owner
    token.owner = owner.toHexString();
    token.on_sale = tokenContract.getItemInfo(event.params.tokenId)[0].onSale;
    token.last_change = event.block.timestamp;
  }
  token.save();

  let user = User.load(event.params.to.toHexString());
  if (!user) {
    user = new User(event.params.to.toHexString());
    user.save();
  }

}

export function handlebuyed(event: buyed): void {

}
