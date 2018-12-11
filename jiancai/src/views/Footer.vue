<template>
    <footer id="footer">
        <div>
            <ul>
                <a href="#">首页</a>
                <li>|</li>
                <a href="#">关于我们</a>
                <li>|</li>
                <a href="#">联系我们</a>
            </ul>
            <div>&copy;2018&nbsp;北京建材有限公司&nbsp;版权所有</div>
        </div>
    </footer>
</template>
<script>
    export default{
        
    }
</script>
<style scoped>
    #footer{
        width: 100%;
        height: 80px;
        background: #000;
        padding: 15px 0;
    }
    #footer>div{
        width: 1200px;
        margin: 0 auto;
    }
    #footer>div>ul{
        list-style: none;
        padding: 0;
        margin:0;
        width: 1200px;
        text-align: center;
        height: 38px;
    }
    #footer>div>ul>a+li{
        color: #fff;
        width: 35px;
        height: 18px;
        display: inline-block !important;
        text-align: center;
        font-size: 13px;
    }
    #footer>div>ul>a{
        color: #fff;
        text-decoration: none;
    }
    #footer>div>div{
        width: 1200px;
        text-align: center;
        color: #666;
        display: inline-block;
    }


</style>