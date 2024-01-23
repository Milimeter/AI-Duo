import 'dart:developer';

import 'package:ai_duo/services/storage.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_ffi.dart';
import 'package:trust_wallet_core_lib/trust_wallet_core_lib.dart';
import 'package:hex/hex.dart';

import 'strings.dart';

class ReturnWalletAddress {
  final String symbol;

  ReturnWalletAddress({required this.symbol});

  Future<String> getWalletPrivatekey() async {
    String mnemonics = await Storage.readData(WALLET_MNEMONICS);
    HDWallet walletInstance = HDWallet.createWithMnemonic(mnemonics);
    String selectedWalletPrivateKey = "";
    int coinType = getCoinType();
    PrivateKey pky = walletInstance.getKeyForCoin(coinType);
    selectedWalletPrivateKey = HEX.encode(pky.data());
    log("my private key: $selectedWalletPrivateKey");
    return selectedWalletPrivateKey;
  }

  int getCoinType() {
    int coinType = 0;
    switch (symbol) {
      case 'ETH':
        coinType = TWCoinType.TWCoinTypeEthereum;
        break;
      case 'BTC':
        coinType = TWCoinType.TWCoinTypeBitcoin;
        break;
      case 'MATIC':
        coinType = TWCoinType.TWCoinTypePolygon;
        break;
      case 'BNB':
        coinType = TWCoinType.TWCoinTypeSmartChain;
        break;
      case 'FTM':
        coinType = TWCoinType.TWCoinTypeFantom;
        break;
      default:
        coinType = TWCoinType.TWCoinTypeEthereum;
    }

    return coinType;
  }

  Future<String> getWalletAddress() async {
    String mnemonics = await Storage.readData(WALLET_MNEMONICS);
    HDWallet walletInstance = HDWallet.createWithMnemonic(mnemonics);
    String selectedWalletAddress = "";
    switch (symbol) {
      case 'AE':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeAeternity);
        log(selectedWalletAddress);
        break;
      case 'AION':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeAion);
        log(selectedWalletAddress);
        break;
      case 'BNB':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain);
        log(selectedWalletAddress);
        break;
      case 'BSC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain);
        log(selectedWalletAddress);
        break;
      case 'BTC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeBitcoin);
        log(selectedWalletAddress);
        break;
      case 'BCH':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeBitcoinCash);
        log(selectedWalletAddress);
        break;
      case 'BTG':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeBitcoinGold);
        log(selectedWalletAddress);
        break;
      case 'CLO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeCallisto);
        log(selectedWalletAddress);
        break;
      case 'ADA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeCardano);
        log(selectedWalletAddress);
        break;
      case 'ATOM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeCosmos);
        log(selectedWalletAddress);
        break;
      case 'DASH':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeDash);
        log(selectedWalletAddress);
        break;
      case 'DCR':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeDecred);
        log(selectedWalletAddress);
        break;
      case 'DGB':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeDigiByte);
        log(selectedWalletAddress);
        break;
      case 'DOGE':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeDogecoin);
        log(selectedWalletAddress);
        break;
      case 'EOS':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeEOS);
        log(selectedWalletAddress);
        break;
      case 'ETH':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
        log(selectedWalletAddress);
        break;
      case 'ETC':
        selectedWalletAddress = walletInstance
            .getAddressForCoin(TWCoinType.TWCoinTypeEthereumClassic);
        log(selectedWalletAddress);
        break;
      case 'FIO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeFIO);
        log(selectedWalletAddress);
        break;
      case 'GO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeGoChain);
        log(selectedWalletAddress);
        break;
      case 'GRS':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeGroestlcoin);
        log(selectedWalletAddress);
        break;
      case 'ICX':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeICON);
        log(selectedWalletAddress);
        break;
      case 'IOTX':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeIoTeX);
        log(selectedWalletAddress);
        break;
      case 'KAVA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeKava);
        log(selectedWalletAddress);
        break;
      case 'KIN':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeKin);
        log(selectedWalletAddress);
        break;
      case 'LTC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeLitecoin);
        log(selectedWalletAddress);
        break;
      case 'MONA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeMonacoin);
        log(selectedWalletAddress);
        break;
      case 'NAS':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNebulas);
        log(selectedWalletAddress);
        break;
      case 'NULS':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNULS);
        log(selectedWalletAddress);
        break;
      case 'NXO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNano);
        log(selectedWalletAddress);
        break;
      case 'NEAR':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNEAR);
        log(selectedWalletAddress);
        break;
      case 'NIM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNimiq);
        log(selectedWalletAddress);
        break;
      case 'ONT':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeOntology);
        log(selectedWalletAddress);
        break;
      case 'POA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypePOANetwork);
        log(selectedWalletAddress);
        break;
      case 'QTUM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeQtum);
        log(selectedWalletAddress);
        break;

      case 'XRP':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeXRP);
        log(selectedWalletAddress);
        break;

      case 'SOL':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeSolana);
        log(selectedWalletAddress);
        break;
      case 'XLM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeStellar);
        log(selectedWalletAddress);
        break;
      case 'XTZ':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeTezos);
        log(selectedWalletAddress);
        break;
      case 'USDT':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
        log(selectedWalletAddress);
        break;
      case 'TT':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeThunderToken);
        log(selectedWalletAddress);
        break;
      case 'NEO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeNEO);
        log(selectedWalletAddress);
        break;
      case 'TOMO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeTomoChain);
        log(selectedWalletAddress);
        break;
      case 'TRX':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeTron);
        log(selectedWalletAddress);
        break;
      case 'VET':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeVeChain);
        log(selectedWalletAddress);
        break;
      case 'VIA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeViacoin);
        log(selectedWalletAddress);
        break;
      case 'WAN':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeWanchain);
        log(selectedWalletAddress);
        break;
      case 'ZEC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeZcash);
        log(selectedWalletAddress);
        break;

      case 'ZIL':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeZilliqa);
        log(selectedWalletAddress);
        break;
      case 'ZEL':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeZelcash);
        log(selectedWalletAddress);
        break;
      case 'RVN':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeRavencoin);
        log(selectedWalletAddress);
        break;
      case 'WAVES':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeWaves);
        log(selectedWalletAddress);
        break;
      case 'LUNA':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeTerra);
        log(selectedWalletAddress);
        break;
      case 'ONE':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeHarmony);
        log(selectedWalletAddress);
        break;
      case 'ALGO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeAlgorand);
        log(selectedWalletAddress);
        break;
      case 'KSM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeKusama);
        log(selectedWalletAddress);
        break;
      case 'DOT':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypePolkadot);
        log(selectedWalletAddress);
        break;
      case 'FIL':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeFilecoin);
        log(selectedWalletAddress);
        break;
      case 'ELGD':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeElrond);
        log(selectedWalletAddress);
        break;
      case 'BAND':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeBandChain);
        log(selectedWalletAddress);
        break;
      // case 'BSC':
      //   selectedWalletAddress = walletInstance
      //       .getAddressForCoin(TWCoinType.TWCoinTypeSmartChainLegacy);
      //   log(selectedWalletAddress);
      //   break;
      // case 'BSC':
      //   selectedWalletAddress =
      //       walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeSmartChain);
      //   log(selectedWalletAddress);
      //   break;
      case 'OASIS':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeOasis);
        log(selectedWalletAddress);
        break;
      case 'MATIC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypePolygon);
        log(selectedWalletAddress);
        break;
      case 'RUNE':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeTHORChain);
        log(selectedWalletAddress);
        break;
      case 'BLZ':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeBluzelle);
        log(selectedWalletAddress);
        break;
      case 'OP':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeOptimism);
        log(selectedWalletAddress);
        break;
      case 'ARB':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeArbitrum);
        log(selectedWalletAddress);
        break;
      case 'ECOC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeECOChain);
        log(selectedWalletAddress);
        break;
      case 'AVAX':
        selectedWalletAddress = walletInstance
            .getAddressForCoin(TWCoinType.TWCoinTypeAvalancheCChain);
        log(selectedWalletAddress);
        break;
      case 'XDAI':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeXDai);
        log(selectedWalletAddress);
        break;
      case 'FTM':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeFantom);
        log(selectedWalletAddress);
        break;

      case 'CELO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeCelo);
        log(selectedWalletAddress);
        break;
      case 'RON':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeRonin);
        log(selectedWalletAddress);
        break;
      case 'OSMO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeOsmosis);
        log(selectedWalletAddress);
        break;
      case 'XEC':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeECash);
        log(selectedWalletAddress);
        break;
      case 'CRO':
        selectedWalletAddress =
            walletInstance.getAddressForCoin(TWCoinType.TWCoinTypeCronosChain);
        log(selectedWalletAddress);
        break;

      default:
        selectedWalletAddress = "";
    }
    return selectedWalletAddress;
  }
}
