package com.gamecook.frogue.maps
{
    import flash.geom.Point;

    /**
     * The MIT License
     *
     * Copyright (c) 2009 @author jessefreeman
     *
     * Permission is hereby granted, free of charge, to any person obtaining a copy
     * of this software and associated documentation files (the "Software"), to deal
     * in the Software without restriction, including without limitation the rights
     * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
     * copies of the Software, and to permit persons to whom the Software is
     * furnished to do so, subject to the following conditions:
     *
     * The above copyright notice and this permission notice shall be included in
     * all copies or substantial portions of the Software.
     *
     * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
     * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
     * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
     * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
     * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
     * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
     * THE SOFTWARE.
     *
     */
    public class Map implements IMap
    {
        protected var tiles:Array = [];
        protected var dirs:Array;


        protected var mapsize:Number;
        protected var paths:Array;
        protected var _rooms:Array;
        protected var _width:Number;
        protected var _height:Number;
        protected var openTiles:Array = [];

        /**
         *
         * @param self
         * @throws Error
         */
        public function Map()
        {
            //TODO need to pass in width/height into constructor
        }

        /**
         *
         * @param tiles
         */
        public function addRow(tiles:Array):void
        {
            tiles.push(tiles);
        }

        /**
         *
         * @param position
         * @return
         */
        public function getTileType(position:Point):String
        {
            return tiles[position.y][position.x];
        }

        /**
         *
         * @param id
         */
        public function removeRow(id:int):void
        {
            tiles.splice(id, 1);
        }

        /**
         *
         * @return
         */
        /*
         [Deprecated]
         public function get tiles() : Array
         {
         return _tiles.slice();
         }

         */
        /**
         *
         * @param value
         */
        /*
         [Deprecated]
         public function set tiles(value : Array) : void
         {
         //TODO Need to index tiles to find empty tiles.
         _tiles = value.slice();
         _width = tiles[0].length;
         _height = tiles.length;
         indexOpenTiles();
         }
         */
        protected function indexOpenTiles():void
        {
            var row:int;
            var column:int;
            var totalRows:int = height;
            var totalColumns:int = width;
            var tile:String;

            for (row = 0; row < _height; row++)
            {
                for (column = 0; column < _width; column++)
                {
                    tile = tiles[row][column];
                    if (tile != "#")
                        openTiles.push(new Point(column, row));
                }
            }
        }

        /**
         *
         * @return
         */
        public function toString():String
        {
            var stringMap:String = "";
            var total:int = tiles.length;
            var i:int;
            // Render Map
            for (i = 0; i < total; i ++)
            {
                stringMap = stringMap + (tiles[i] as Array).join() + "\n";
            }

            return stringMap;
        }

        public function get width():int
        {
            return _width;
        }

        public function get height():int
        {
            return _height;
        }

        //TODO need to unit test this
        public function swapTile(point:Point, value:String):String
        {
            var oldValue:String = tiles[point.y][point.x];
            tiles[point.y][point.x] = value;
            return oldValue;
        }

        public function getTileID(row:int, column:int):int
        {
            return row * width + column;
        }

        public function tileIDToPoint(id:int):Point
        {
            return new Point(id % _width, id / _width);
        }

        public function getOpenTiles():Array
        {
            return openTiles;
        }

        public function toObject():Object
        {
            var mapObj:Object = {};
            mapObj.tiles = tiles;
            return mapObj;
        }

        public function getTiles():Array
        {
            return tiles;
        }

        public function setTiles(value:Array):void
        {
            //TODO Need to index tiles to find empty tiles.
            tiles = value.slice();
            _width = tiles[0].length;
            _height = tiles.length;
            indexOpenTiles();
        }
    }
}
