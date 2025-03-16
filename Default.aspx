<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  
  
    
     <div class="index-banner">
       
          <div class="wmuSlider example1" style="height: 270px;">
            <div class="wmuSliderWrapper">
                <article style="position: relative; width: 300%; opacity: 1;">
                    <div class="banner-wrap">
                        <div class="slider-left">
                            <img src="Images/bg2.jpg" alt="" />
                        </div>
                        <div class="slider-right">
                         
                        </div>
                        <div class="clear"></div>
                    </div>
                </article>
                <article style="position: absolute; width: 300%; opacity: 0;">
                    <div class="banner-wrap">
                        <div class="slider-left">
                            <img src="Images/bg6.jpg" alt="" />
                        </div>
                        <div class="slider-right">
                           
                         </div>
                        <div class="clear"></div>
                    </div>
                </article>
                <article style="position: absolute; width: 300%; opacity: 0;">
                    <div class="banner-wrap">
                        <div class="slider-left">
                           <img src="Images/bg4.jpg" alt="" />
                        </div>
                        <div class="slider-right">
                          
                          
                        </div>
                        <div class="clear"></div>
                    </div>
                </article>
                <article style="position: absolute; width: 300%; opacity: 0;">
                    <div class="banner-wrap">
                        <div class="slider-left">
                            <img src="Images/bg5.jpg" alt="" />
                        </div>
                        <div class="slider-right">
                          
                        </div>
                        <div class="clear"></div>
                    </div>
                </article>
            </div>
            <a class="wmuSliderPrev">Previous</a><a class="wmuSliderNext">Next</a>
            <ul class="wmuSliderPagination">
                <li><a href="#" class="">0</a></li>
                <li><a href="#" class="">1</a></li>
                <li><a href="#" class="wmuActive">2</a></li>
                <li><a href="#">3</a></li>
   
            </ul>
            <a class="wmuSliderPrev">Previous</a>
            <a class="wmuSliderNext">Next</a>
            <ul class="wmuSliderPagination">
                <li><a href="#" class="wmuActive">0</a></li>
                <li><a href="#" class="">1</a></li>
                <li><a href="#" class="">2</a></li>
                <li><a href="#" class="">3</a></li>
               
            </ul>
        </div>


        <script src="js/jquery.wmuSlider.js"></script>
        <script type="text/javascript" src="js/modernizr.custom.min.js"></script>
        <script>
            $('.example1').wmuSlider();
            
   			</script>
    </div>
    <div class="main">
        <div class="wrap">
            <div class="content-bottom">
                <div class="box1" style="width: 100%;">
                    <asp:Repeater ID="rptpro" runat="server">
                        <ItemTemplate>
                            <div class="col_1_of_3 span_1_of_3">
                                <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                                    <div class="view view-fifth" style="box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);  ">
                                        <div class="top_box" >
                                            
                                            <!--<p class="m_2"></p>-->
                                            <div class="grid_img" style="">
                                                <div class="css3" >
                                                    <img src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" height="250rem" width="350rem" alt="Not Work"  />
                                                   <!-- <img src="Images/21/vivo.jpeg"/>-->
                                                </div>
                                                <div class="mask">
                                               <div class="info"> Detail </div> 
                                                  
                                                </div>
                                            </div>
                                            <h2 class="m_1" style="color: #000;  text-align:center; font-size:500;"><%#Eval("product_name") %></h2>
                                            <div class="price" style="color: #ff0000; text-align:center; ">₹. <%#Eval("product_price") %></div>
                                        </div>
                                        
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="clear"></div>
                </div>
                <div class="box1">
                    <asp:Repeater ID="rptpro2" runat="server">
                       <ItemTemplate>
                            <div class="col_1_of_3 span_1_of_3">
                                <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                                    <div class="view view-fifth" style="box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);  ">
                                        <div class="top_box" >
                                            
                                            <!--<p class="m_2">  </p>-->
                                            <div class="grid_img"">
                                                <div class="css3" >
                                                  <img src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" height="250rem" width="350rem" alt="Not Work" />
                                                   <!-- <img src="Images/21/vivo.jpeg"/>-->
                                                </div>
                                                <div class="mask">
                                               <div class="info">
                                                    Detail

                                               </div> 
                                                  
                                                </div>
                                            </div>
                                            <h2 class="m_1" style="color: #000; text-align:center; font-size:500;"><%#Eval("product_name") %></h2>
                                            <div class="price" style="color: #ff0000; text-align:center; ">₹. <%#Eval("product_price") %></div>
                                            <h3></h3>
                                        </div>
                                        
                                    </div>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="clear"></div>
                </div>  
                <div class="clear"></div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>

