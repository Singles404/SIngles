import {Test, console} from "forge-std/Test.sol";
import {Singles404} from "../src/Singles404.sol";

contract Singles404Test is Test {
    Singles404 singles;
    address owner = address(0x12345);
    address uniswap = address(0x98765);

    function setUp() public {
        singles = new Singles404(owner);
        
        vm.startPrank(owner);
        singles.setDataURI("https://raw.github.io/asset/");
        singles.setWhitelist(uniswap, true);
        singles.transfer(uniswap, 9000 * 1e18);
        vm.stopPrank();
    }

    function test_initial_deployment() public {
        console.log(
            "balance of owner/deployer : ",
            singles.balanceOf(owner)
        );
        console.log(
            "balance of uniswap : ",
            singles.balanceOf(uniswap)
        );
        console.log("total minted : ", singles.minted());
        console.log("Is owner whitelisted : ", singles.whitelist(owner));

        // Send tokens in uniswap to some address
        vm.prank(uniswap);
        singles.transfer(address(123), 100 ether);

        console.log("total minted : ", singles.minted());

        for (uint8 i =0; i < 100; i++) {
            console.logString(singles.tokenURI(i));
        }
    }

}