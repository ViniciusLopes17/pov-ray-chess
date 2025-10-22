// POV-Ray 3.7 Scene File
// Tabuleiro de Xadrez COMPLETO (8x8) sobre MESA com CADEIRAS MAIORES, PAREDES DE SALA MAIOR e PORTA
// AUTOR: Assistente de IA do Google

#include "colors.inc"

// Câmera (Ajustada para enquadrar a sala maior)
camera {
  location <-35, 45, -60>
  look_at <0, 0, 0>
  angle 40
}

// Luz
light_source {
  <15, 40, -15>
  color White
}

// =========================================================
// TEXTURAS (MANTIDAS)
// =========================================================

#declare Ebony = texture { pigment { color rgb <0.05, 0.05, 0.05> } finish { phong 0.8 phong_size 30 specular 0.1 reflection 0.05 ambient 0.0 diffuse 0.9 } }
#declare WhiteMarble = texture { pigment { color rgb <0.95, 0.95, 0.95> } finish { phong 0.7 phong_size 30 specular 0.7 reflection 0.1 ambient 0.01 diffuse 0.8 } }
#declare WhiteStone = texture { pigment { color rgb <0.9, 0.9, 0.9> } finish { phong 0.4 phong_size 10 specular 0.2 reflection 0.05 ambient 0.01 diffuse 0.8 } }
#declare LightSquare  = pigment { color rgb <1.0, 1.0, 1.0> }
#declare DarkSquare   = pigment { color rgb <0.55, 0.35, 0.15> }
#declare TableWood = texture { pigment { color rgb <0.1, 0.1, 0.1> } finish { phong 0.1 diffuse 0.9 ambient 0.0 reflection 0.0 } }
#declare RusticWood = texture {
    pigment { color rgb <0.4, 0.2, 0.05> }
    finish {
        phong 0.2
        diffuse 0.8
        ambient 0.02
        reflection 0.01
    }
}

// =========================================================
// DEFINIÇÕES DE OBJETOS: GEOMETRIA DAS PEÇAS E MESA
// =========================================================

#declare Pawn = object { union { cylinder { <0, 0, 0>, <0, 0.5, 0>, 1.0 } cone { <0, 0.5, 0>, 0.8, <0, 3, 0>, 0.1 } cylinder { <0, 3, 0>, <0, 3.2, 0>, 0.2 } sphere { <0, 3.3, 0>, 0.25 } } };
#declare KNIGHT_SCALE = 0.54615; #declare Knight_Geo = object { union { cylinder { <0, 0, 0>, <0, 0.7, 0>, 1.2 } cylinder { <0, 0.7, 0>, <0, 2.5, 0>, 0.8 } cone { <0, 2.5, 0>, 0.8, <1.5, 4.5, 0>, 0.4 } sphere { <2.0, 5.0, 0>, 0.9 } cylinder { <2.8, 5.0, 0>, <3.5, 5.0, 0>, 0.5 } cone { <2.0, 5.8, 0.4>, 0.3, <2.0, 6.5, 0.4>, 0.1 } cylinder { <1.5, 4.5, 0>, <0.8, 5.0, 0>, 0.6 rotate <0, 0, -20> } } scale KNIGHT_SCALE };
#declare Rook_Height = 6.0; #declare Rook_Base_Radius = 1.8; #declare Rook_Body_Radius = 1.3; #declare Rook_Top_Radius = 1.5; #declare ROOK_Y_SCALE = 0.6666; #declare ROOK_XZ_SCALE = 0.6; #declare Rook_Geo = object { union { cylinder { <0, 0, 0>, <0, 0.5, 0>, Rook_Base_Radius } cylinder { <0, 0.5, 0>, <0, Rook_Height - 1.0, 0>, Rook_Body_Radius } difference { object { cylinder { <0, Rook_Height - 1.0, 0>, <0, Rook_Height, 0>, Rook_Top_Radius } } #declare Recortador = box { < -Rook_Top_Radius, Rook_Height - 1.0, -0.2 >, < Rook_Top_Radius, Rook_Height, 0.2 > } #for (I, 0, 3, 1) object { Recortador rotate <0, I*90, 0> } #end } } scale <ROOK_XZ_SCALE, ROOK_Y_SCALE, ROOK_XZ_SCALE> };
#declare Bishop_Height = 5.0; #declare Bishop_Base_Radius = 1.0; #declare Bishop_Body_Radius_Bottom = 0.8; #declare Bishop_Body_Radius_Top = 0.2; #declare Bishop_Neck_Height = 0.3; #declare Bishop_Head_Radius = 0.6; #declare Bishop_Slot_Width = 0.2; #declare Bishop_Slot_Depth = 0.6; #declare Bishop_Slot_Height = 0.8; #declare Bishop_Geo = object { union { cylinder { <0, 0, 0>, <0, 0.5, 0>, Bishop_Base_Radius } cone { <0, 0.5, 0>, Bishop_Body_Radius_Bottom, <0, Bishop_Height - Bishop_Head_Radius - Bishop_Neck_Height, 0>, Bishop_Body_Radius_Top } cylinder { <0, Bishop_Height - Bishop_Head_Radius - Bishop_Neck_Height, 0>, <0, Bishop_Height - Bishop_Head_Radius, 0>, Bishop_Body_Radius_Top * 1.2 } difference { object { sphere { <0, Bishop_Height - Bishop_Head_Radius, 0>, Bishop_Head_Radius } } object { box { < -Bishop_Slot_Width/2, Bishop_Height - Bishop_Head_Radius - Bishop_Slot_Height/2, -Bishop_Slot_Depth/2 >, < Bishop_Slot_Width/2, Bishop_Head_Radius * 1.5, Bishop_Slot_Depth/2 > } rotate <0, 90, 0> } } } };
#declare Queen_Height = 7.5; #declare Queen_Base_Radius = 1.2; #declare Queen_Body_Bottom_Radius = 1.0; #declare Queen_Body_Top_Radius = 0.3; #declare Queen_Neck_Radius = 0.4; #declare Queen_Head_Radius = 0.7; #declare Crown_Spike_Radius = 0.15; #declare Crown_Spike_Height = 0.4; #declare Queen_Geo = object { union { cylinder { <0, 0, 0>, <0, 0.5, 0>, Queen_Base_Radius } cone { <0, 0.5, 0>, Queen_Body_Bottom_Radius, <0, Queen_Height * 0.4, 0>, Queen_Body_Bottom_Radius * 0.7 } cone { <0, Queen_Height * 0.4, 0>, Queen_Body_Bottom_Radius * 0.7, <0, Queen_Height * 0.7, 0>, Queen_Body_Top_Radius } cylinder { <0, Queen_Height * 0.7, 0>, <0, Queen_Height * 0.8, 0>, Queen_Neck_Radius } sphere { <0, Queen_Height * 0.8 + Queen_Head_Radius * 0.7, 0>, Queen_Head_Radius } cylinder { <0, Queen_Height * 0.8 + Queen_Head_Radius * 1.4, 0>, <0, Queen_Height * 0.8 + Queen_Head_Radius * 1.5, 0>, Queen_Head_Radius * 0.8 hollow } #for (I, 0, 3, 1) union { cone { <0, Queen_Height * 0.8 + Queen_Head_Radius * 1.5, 0>, Crown_Spike_Radius * 1.5, <0, Queen_Height * 0.8 + Queen_Head_Radius * 1.5 + Crown_Spike_Height, 0>, Crown_Spike_Radius } sphere { <0, Queen_Height * 0.8 + Queen_Head_Radius * 1.5 + Crown_Spike_Height, 0>, Crown_Spike_Radius } rotate <0, I*90 + 45, 0> } #end } };
#declare King_Height = 8.0; #declare King_Base_Radius = 1.3; #declare King_Body_Bottom_Radius = 1.1; #declare King_Body_Middle_Radius = 0.9; #declare King_Body_Top_Radius = 0.5; #declare King_Neck_Radius = 0.6; #declare King_Head_Radius = 0.8; #declare Cross_Arm_Length = 0.8; #declare Cross_Arm_Thickness = 0.2; #declare King_Geo = object { union { cylinder { <0, 0, 0>, <0, 0.5, 0>, King_Base_Radius } cylinder { <0, 0.5, 0>, <0, King_Height * 0.3, 0>, King_Body_Bottom_Radius } cone { <0, King_Height * 0.3, 0>, King_Body_Bottom_Radius, <0, King_Height * 0.6, 0>, King_Body_Middle_Radius } cone { <0, King_Height * 0.6, 0>, King_Body_Middle_Radius, <0, King_Height * 0.75, 0>, King_Body_Top_Radius } cylinder { <0, King_Height * 0.75, 0>, <0, King_Height * 0.85, 0>, King_Neck_Radius } sphere { <0, King_Height * 0.85 + King_Head_Radius * 0.7, 0>, King_Head_Radius } union { cylinder { <0, King_Height * 0.85 + King_Head_Radius * 1.4, 0>, <0, King_Height * 0.85 + King_Head_Radius * 1.4 + Cross_Arm_Length, 0>, Cross_Arm_Thickness / 2 } cylinder { < -Cross_Arm_Length / 2, King_Height * 0.85 + King_Head_Radius * 1.4 + Cross_Arm_Length / 2, 0>, < Cross_Arm_Length / 2, King_Height * 0.85 + King_Head_Radius * 1.4 + Cross_Arm_Length / 2, 0>, Cross_Arm_Thickness / 2 } } } };

// DEFINIÇÕES DE PEÇAS (TEXTURIZADAS)
#declare WhitePawn   = object { Pawn texture { WhiteMarble } }; #declare WhiteRook   = object { Rook_Geo texture { WhiteStone } }; #declare WhiteKnight = object { Knight_Geo texture { WhiteMarble } }; #declare WhiteBishop = object { Bishop_Geo texture { WhiteMarble } }; #declare WhiteQueen  = object { Queen_Geo texture { WhiteMarble } }; #declare WhiteKing   = object { King_Geo texture { WhiteMarble } };
#declare BlackPawn   = object { Pawn texture { Ebony } }; #declare BlackRook   = object { Rook_Geo texture { Ebony } }; #declare BlackKnight = object { Knight_Geo texture { Ebony } }; #declare BlackBishop = object { Bishop_Geo texture { Ebony } }; #declare BlackQueen  = object { Queen_Geo texture { Ebony } }; #declare BlackKing   = object { King_Geo texture { Ebony } };

// DEFINIÇÃO: MESA DE XADREZ
<<<<<<< Updated upstream
#declare Table_Size_XZ = 20.0; 
#declare Table_Top_Height = 1.5; 
#declare Table_Skirt_Height = 2.0; 
#declare Table_Pedestal_Height = 12.0; 
#declare Table_Base_Size = 8.0;
#declare ChessTable = object { union { difference { box { < -Table_Size_XZ/2, 0, -Table_Size_XZ/2 >, < Table_Size_XZ/2, Table_Top_Height, Table_Size_XZ/2 > } 
                                                    box { < -8.0, Table_Top_Height - 0.1, -8.0 >, < 8.0, Table_Top_Height + 0.1, 8.0 > translate <0, -0.01, 0> }
                                                  } 
                                       box { 
                                             < -Table_Size_XZ/2, -Table_Skirt_Height, -Table_Size_XZ/2 >, 
                                             < Table_Size_XZ/2, 0, Table_Size_XZ/2 > 
                                           } 
                                       box { 
                                             < -Table_Base_Size/4, -Table_Pedestal_Height - Table_Skirt_Height, -Table_Base_Size/4 >, 
                                             < Table_Base_Size/4, -Table_Skirt_Height, Table_Base_Size/4 > 
                                           } 
                                       box { 
                                             < -Table_Base_Size/2, -Table_Pedestal_Height - Table_Skirt_Height - 1.0, -Table_Base_Size/2 >, 
                                             < Table_Base_Size/2, -Table_Pedestal_Height - Table_Skirt_Height, Table_Base_Size/2 > 
                                           } 
                                     } texture { TableWood } 
                             };
                                             
box{ <-10, -20, -2> <10, 2, 2> }
=======
#declare Table_Size_XZ = 20.0; #declare Table_Top_Height = 1.5; #declare Table_Skirt_Height = 2.0; #declare Table_Pedestal_Height = 12.0; #declare Table_Base_Size = 8.0;
#declare ChessTable = object { union { difference { box { < -Table_Size_XZ/2, 0, -Table_Size_XZ/2 >, < Table_Size_XZ/2, Table_Top_Height, Table_Size_XZ/2 > } box { < -8.0, Table_Top_Height - 0.1, -8.0 >, < 8.0, Table_Top_Height + 0.1, 8.0 > translate <0, -0.01, 0> } } box { < -Table_Size_XZ/2, -Table_Skirt_Height, -Table_Size_XZ/2 >, < Table_Size_XZ/2, 0, Table_Size_XZ/2 > } box { < -Table_Base_Size/4, -Table_Pedestal_Height - Table_Skirt_Height, -Table_Base_Size/4 >, < Table_Base_Size/4, -Table_Skirt_Height, Table_Base_Size/4 > } box { < -Table_Base_Size/2, -Table_Pedestal_Height - Table_Skirt_Height - 1.0, -Table_Base_Size/2 >, < Table_Base_Size/2, -Table_Pedestal_Height - Table_Skirt_Height, Table_Base_Size/2 > } } texture { TableWood } };

// DEFINIÇÃO: CADEIRA RÚSTICA (AJUSTADA PARA TAMANHO MAIOR)
#declare CHAIR_HEIGHT_TOTAL = 25.0;  // Altura total da cadeira (Maior)
#declare SEAT_TOP_HEIGHT = 12.0;    // Altura do assento (Mais alta)
#declare SEAT_SIZE_X = 10.0;        // Largura do assento (Maior)
#declare SEAT_SIZE_Z = 8.0;         // Profundidade do assento (Maior)
#declare LEG_THICKNESS = 1.5;       // Espessura das pernas (Mais robusta)
#declare BACK_SLAT_COUNT = 3;
#declare BACK_SLAT_WIDTH = 1.0;     // Ripas do encosto ligeiramente mais grossas
#declare BACK_SLAT_SPACING = 1.0;   // Espaçamento entre ripas (ajustado para novo tamanho)

#declare RusticChair = object {
    union {
        // Assento
        box {
            < -SEAT_SIZE_X/2, SEAT_TOP_HEIGHT - LEG_THICKNESS/2, -SEAT_SIZE_Z/2 >,
            < SEAT_SIZE_X/2, SEAT_TOP_HEIGHT + LEG_THICKNESS/2, SEAT_SIZE_Z/2 >
        }
        // Pernas
        box { < -SEAT_SIZE_X/2, 0, -SEAT_SIZE_Z/2 >, < -SEAT_SIZE_X/2 + LEG_THICKNESS, SEAT_TOP_HEIGHT, -SEAT_SIZE_Z/2 + LEG_THICKNESS > }
        box { < SEAT_SIZE_X/2 - LEG_THICKNESS, 0, -SEAT_SIZE_Z/2 >, < SEAT_SIZE_X/2, SEAT_TOP_HEIGHT, -SEAT_SIZE_Z/2 + LEG_THICKNESS > }
        box { < -SEAT_SIZE_X/2, 0, SEAT_SIZE_Z/2 - LEG_THICKNESS >, < -SEAT_SIZE_X/2 + LEG_THICKNESS, SEAT_TOP_HEIGHT, SEAT_SIZE_Z/2 > }
        box { < SEAT_SIZE_X/2 - LEG_THICKNESS, 0, SEAT_SIZE_Z/2 - LEG_THICKNESS >, < SEAT_SIZE_X/2, SEAT_TOP_HEIGHT, SEAT_SIZE_Z/2 > }
        // Encosto (com barras verticais e ripas horizontais)
        box { < -SEAT_SIZE_X/2, SEAT_TOP_HEIGHT + LEG_THICKNESS/2, SEAT_SIZE_Z/2 - LEG_THICKNESS >, < -SEAT_SIZE_X/2 + LEG_THICKNESS, CHAIR_HEIGHT_TOTAL, SEAT_SIZE_Z/2 > }
        box { < SEAT_SIZE_X/2 - LEG_THICKNESS, SEAT_TOP_HEIGHT + LEG_THICKNESS/2, SEAT_SIZE_Z/2 - LEG_THICKNESS >, < SEAT_SIZE_X/2, CHAIR_HEIGHT_TOTAL, SEAT_SIZE_Z/2 > }

        #local BACK_AREA_HEIGHT = CHAIR_HEIGHT_TOTAL - (SEAT_TOP_HEIGHT + LEG_THICKNESS/2);
        #local STEP_Y = BACK_AREA_HEIGHT / BACK_SLAT_COUNT;

        #for (I, 0, BACK_SLAT_COUNT - 1, 1)
            #local SlatY_Center = SEAT_TOP_HEIGHT + LEG_THICKNESS/2 + (I * STEP_Y) + (STEP_Y / 2);

            box {
                < -SEAT_SIZE_X/2 + LEG_THICKNESS, SlatY_Center - BACK_SLAT_WIDTH/2, SEAT_SIZE_Z/2 - LEG_THICKNESS >,
                < SEAT_SIZE_X/2 - LEG_THICKNESS, SlatY_Center + BACK_SLAT_WIDTH/2, SEAT_SIZE_Z/2 >
            }
        #end
    }
    texture { RusticWood }
};

>>>>>>> Stashed changes

// =========================================================
// CENA: MESA, TABULEIRO, PEÇAS, CADEIRAS E PAREDES DA SALA
// =========================================================

// 1. A MESA
object { ChessTable }

// 2. TABULEIRO 8x8
#declare SQUARE_SIZE = 2.0;
#for (X_i, 0, 7, 1)
    #for (Z_i, 0, 7, 1)
        #local PosX = (X_i - 3.5) * SQUARE_SIZE;
        #local PosZ = (Z_i - 3.5) * SQUARE_SIZE;
        #if (mod(X_i + Z_i, 2) = 0)
            #declare SquareColor = LightSquare
        #else
            #declare SquareColor = DarkSquare
        #end
        box {
            < -SQUARE_SIZE/2, -0.01, -SQUARE_SIZE/2 >,
            < SQUARE_SIZE/2, 0, SQUARE_SIZE/2 >
            pigment { SquareColor }
            translate < PosX, Table_Top_Height, PosZ >
        }
    #end
#end


// 3. AS PEÇAS
// --- PEÇAS BRANCAS (ALINHAMENTO COM BORDAS) ---
// Rank 2: Peões Brancos (Z = -5.0)
#for (I, -3.5, 3.5, 1)
  object { WhitePawn translate <I*2, Table_Top_Height, -5.0> }
#end
object { WhiteRook   translate <-7.0, Table_Top_Height, -7.0> }
object { WhiteKnight translate <-5.0, Table_Top_Height, -7.0> }
object { WhiteBishop translate <-3.0, Table_Top_Height, -7.0> }
object { WhiteQueen  translate <-1.0, Table_Top_Height, -7.0> }
object { WhiteKing   translate <1.0, Table_Top_Height, -7.0> }
object { WhiteBishop translate <3.0, Table_Top_Height, -7.0> }
object { WhiteKnight translate <5.0, Table_Top_Height, -7.0> }
object { WhiteRook   translate <7.0, Table_Top_Height, -7.0> }

// --- PEÇAS PRETAS (ALINHAMENTO COM BORDAS) ---
// Rank 7: Peões Pretos (Z = 5.0)
#for (I, -3.5, 3.5, 1)
  object { BlackPawn translate <I*2, Table_Top_Height, 5.0> }
#end
object { BlackRook   translate <-7.0, Table_Top_Height, 7.0> }
object { BlackKnight translate <-5.0, Table_Top_Height, 7.0> }
object { BlackBishop translate <-3.0, Table_Top_Height, 7.0> }
object { BlackQueen  translate <-1.0, Table_Top_Height, 7.0> }
object { BlackKing   translate <1.0, Table_Top_Height, 7.0> }
object { BlackBishop translate <3.0, Table_Top_Height, 7.0> }
object { BlackKnight translate <5.0, Table_Top_Height, 7.0> }
object { BlackRook   translate <7.0, Table_Top_Height, 7.0> }


// 4. CADEIRAS
#declare CHAIR_GROUND_Y = -(Table_Pedestal_Height + Table_Skirt_Height + 1.0);
#declare DISTANCE_FROM_TABLE = 2.0;
#declare SEAT_SIZE_Z = 8.0; // Usar o novo SEAT_SIZE_Z da cadeira

// Cadeira para peças brancas (Z negativo)
object {
    RusticChair
    translate <0, CHAIR_GROUND_Y, -(Table_Size_XZ/2 + DISTANCE_FROM_TABLE + SEAT_SIZE_Z/2)>
}

// Cadeira para peças pretas (Z positivo)
object {
    RusticChair
    translate <0, CHAIR_GROUND_Y, (Table_Size_XZ/2 + DISTANCE_FROM_TABLE + SEAT_SIZE_Z/2)>
    rotate <0, 180, 0>
}


// 5. PAREDES E CHÃO DA SALA
#declare Room_Width = 80.0;
#declare Room_Depth = 80.0;
#declare Room_Height = 40.0;
#declare Wall_Thickness = 1.0;
#declare Room_Floor_Y = -(Table_Pedestal_Height + Table_Skirt_Height + 1.0) - 0.1;

#declare WallColor = pigment { color rgb <0.7, 0.7, 0.7> }

// Chão da Sala
object {
    box {
        < -Room_Width/2, Room_Floor_Y, -Room_Depth/2 >,
        < Room_Width/2, Room_Floor_Y + Wall_Thickness, Room_Depth/2 >
    }
    pigment { WallColor }
}

// Parâmetros da Porta
#declare Door_Width = 10.0;
#declare Door_Height = 20.0;
#declare Door_Offset_X = 0.0;

// As 4 paredes com o recorte da porta
object {
    difference {
        // 1. Cubo externo (volume total das paredes, incluindo o espaço interno)
        box {
            < -Room_Width/2 - Wall_Thickness, Room_Floor_Y, -Room_Depth/2 - Wall_Thickness >,
            < Room_Width/2 + Wall_Thickness, Room_Floor_Y + Room_Height, Room_Depth/2 + Wall_Thickness >
        }

        // 2. Cubo interno (subtrai o espaço vazio da sala)
        box {
            < -Room_Width/2, Room_Floor_Y + Wall_Thickness, -Room_Depth/2 >,
            < Room_Width/2, Room_Floor_Y + Room_Height + 1.0, Room_Depth/2 >
        }

        // 3. Recorte da Porta (SUBTRAI a abertura da parede Z-negativa)
        box {
            < Door_Offset_X - Door_Width/2, Room_Floor_Y + Wall_Thickness, -Room_Depth/2 - Wall_Thickness - 0.1 >,
            < Door_Offset_X + Door_Width/2, Room_Floor_Y + Wall_Thickness + Door_Height, -Room_Depth/2 + 0.1 >
        }
    }
    pigment { WallColor }
}