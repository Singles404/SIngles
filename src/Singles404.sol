//SPDX-License-Identifier: UNLICENSED
                                                                                           
/*                                                                                         
                        The Official Singles404 Contract - ERC404                                                                       
                         .                                                                
                       :@@#.                                                              
                       .%@@@:                  =*#%+.                                     
                         *%%%#:         -#%@@#.@@@@@@:         .=#%@@*                    
                           #@#*%:  =#%%=*@@@@@:@@@@@%::      .*@@@@+                      
                             #@@%:.@@@@@-@@@@@:%@@@@#:%=    .-@@@@:                       
                              -+*@*+@@@@+@@@@@-*%%@@#=*%: :%@##@#:                        
                               :@@@-%@@@@+@@@@#:@@@@+=+==-@@@@@#                          
                                +%#*=@@@%++%###*-++#-=*=#%*@@@#                           
                                :@@@@**#%#=:+=+*:-*=#@@%@@@%@@.                           
                                 *@@@@@#*=+=+:+*#@@@@@@@@@@@@-                            
                                  %@@@@@@@@%-%@@@@@@@@@@@@@*.                             
                                  -@@@@@@@@+%@@@@@@@@@@@@#.                               
                                   *@@@@@@@*.#@@@@@@@@@#-                                 
                                    #@@@@@@@* :+**++=-.                                   
                                     -*###*-=+#++*#@-                                     
                                      -##%@#+#%@@@@%*:                                    
                                      .@@@@@=*#@@@@*.                                     
                                       .:-+*::=*#*:                                       
                                                                                          
                       @@@@@@@@@#  -@@@@*  +@@@@@@@: @@@@@@@@@@@@@@#                      
                       @@@@@@@@@#  @@@@@@: +@@@@@@@: @@@@@@@@@@@@@@%                      
                         %@@@@@+  +@@@@@@%  -@@@@.     @@@@@#   *@@%                      
                         :@@@@@@.:@@@@@@@@+ @@@@=      @@@@@@##= ---                      
                          *@@@@@##@@@@@@@@@#@@@%       @@@@@@**- ...                      
                          .@@@@@@@@@=*@@@@@@@@@:       @@@@@#   =@@%                      
                           =@@@@@@@# .@@@@@@@@*      ==@@@@@%===@@@%                      
                            %@@@@@@.  =@@@@@@@.     .@@@@@@@@@@@@@@%                      
                            .-----:    ------.       ---------------                      

        '########:'##::::'##:'########::::'########:::'#######::'##:::'##::'######::
        ... ##..:: ##:::: ##: ##.....::::: ##.... ##:'##.... ##:. ##:'##::'##... ##:
        ::: ##:::: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##::. ####::: ##:::..::
        ::: ##:::: #########: ######:::::: ########:: ##:::: ##:::. ##::::. ######::
        ::: ##:::: ##.... ##: ##...::::::: ##.... ##: ##:::: ##:::: ##:::::..... ##:
        ::: ##:::: ##:::: ##: ##:::::::::: ##:::: ##: ##:::: ##:::: ##::::'##::: ##:
        ::: ##:::: ##:::: ##: ########:::: ########::. #######::::: ##::::. ######::
        :::..:::::..:::::..::........:::::........::::.......::::::..::::::......:::

                                                                    ~ But not GAYS!

        +-----------------------+                       
        | Welcome to Singles404 |                       
        +-----------------------+                       
        The ultimate token for all the single boys out there! 
        On this Valentine's Day, we're flipping the script and celebrating the joys 
        of independence and hodling strong. With Singles404, you're not just part of
        a community; you're part of a movement. Our token is more than just a meme; 
        it's a symbol of empowerment and solidarity among those with diamond hands who
        march to the beat of their own drum. Whether you're embracing the single life
        by choice or circumstance, join us as we hodl our way to the moon and redefine
        what it means to be unattached and proud. Get ready to laugh, connect, and
        enjoy the journey with 404Singles - where being single is not a glitch, but 
        a badge of honor! 
                                                         +-------------------------+
                                                         |         Follow us       |
                                                         +---------+---------------+
                                                         | Twitter |  @singles404  |
                                                         +---------+---------------+
                                                                                            
 */                                                                                 
                            
pragma solidity ^0.8.0;

import "./ERC404.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Singles404 is ERC404 {
    string public dataURI;
    string public baseTokenURI;

    string[] private personality = [
        "Creative",
        "Humorous",
        "Intellectual",
        "Curious",
        "Confident",
        "Simp",
        "Loyal",
        "Strong",
        "Mysterious"
        "GAY"
    ];

     string[] private hobby = [
        "Tradoor",
        "LP-oor",
        "Leveragoor",
        "MEV Snipoor",
        "Meme-oor",
        "Exploroor",
        "Holdoor",
        "Renvengoor",
        "Miner-or",
        "Airdrop Huntoor"
    ];

    string[] private status = [
        "Rich",
        "Lambo",
        "To The Moon",
        "Rekt",
        "Poor"
    ];

    string[] private mood = [
        "Neutral",
        "Bullish",
        "Bearish",
        "Romantic",
        "High",
        "Horny"
    ];

    constructor(
        address _owner
    ) ERC404("Singles 404", "SINGLES", 18, 10000, _owner) {
        balanceOf[_owner] = 10000 * 10 ** 18;
        whitelist[owner] = true;
    }

    function setDataURI(string memory _dataURI) public onlyOwner {
        dataURI = _dataURI;
    }

    function setTokenURI(string memory _tokenURI) public onlyOwner {
        baseTokenURI = _tokenURI;
    }

    function setNameSymbol(
        string memory _name,
        string memory _symbol
    ) public onlyOwner {
        _setNameSymbol(_name, _symbol);
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        if (bytes(baseTokenURI).length > 0) {
            return string.concat(baseTokenURI, Strings.toString(tokenId));
        } else {
            
            uint8 seed = uint8(bytes1(keccak256(abi.encodePacked(tokenId))));
            string memory image;

            if (seed <= 100) {
                image = "1.png";
            } else if (seed <= 160) {
                image = "2.png";
            } else if (seed <= 210) {
                image = "3.png";
            } else if (seed <= 240) {
                image = "4.png";
            } else if (seed <= 255) {
                image = "5.png";
            }

            string[4] memory traits;
            traits[0] = getHobby(tokenId); 
            traits[1] = getPersonality(tokenId); 
            traits[2] = getMood(tokenId); 
            traits[3] = getStatus(tokenId); 

            string memory jsonPreImage = string.concat(
                string.concat(
                    string.concat('{"name": "Singles #', Strings.toString(tokenId)),
                    '","description":"A collection of 10,000 Premium Singles enabled by ERC404, an experimental token standard enabling semi-fungibility for Ethereum NFTs. (ERC20 X ERC721).","image":"'
                ),
                string.concat(dataURI, image)
            );

            string memory jsonPostImage = string.concat(
                string.concat(
                    string.concat(
                        '","attributes":[{"trait_type":"Hobby","value":"',
                        traits[0]
                    ),
                    string.concat(
                        '","trait_type":"Personality","value":"',
                        traits[1]
                    )
                ),
                string.concat(
                    string.concat(
                        '","trait_type":"Mood","value":"',
                        traits[2]
                    ),
                    string.concat(
                        '","trait_type":"Status","value":"',
                        traits[3]
                    )
                )
            );
            
            string memory jsonPostTraits = '"}]}';

            return
                string.concat(
                    "data:application/json;utf8,",
                    string.concat(
                        string.concat(jsonPreImage, jsonPostImage),
                        jsonPostTraits
                    )
                );
        }
    }

    // Helper functions
    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal pure returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, Strings.toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    function getHobby(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "HOBBY", hobby);
    }

    function getPersonality(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "PERSONALITY", personality);
    }

    function getMood(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "MOOD", mood);
    }

    function getStatus(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "STATUS", status);
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }
}
