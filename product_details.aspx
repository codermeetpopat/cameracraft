<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="product_details.aspx.cs" Inherits="product_details"  EnableEventValidation="false" %>





<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<style>
    .btn-whimsical {
  display: inline-block;
  padding: 5px 20px;
  font-size: 16px;
  border: none;
  border-radius: 50px;
  background-color: #7c0000;
  color: #ffffff;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  transition: transform 0.3s, box-shadow 0.3s;
}

.btn-whimsical:hover {
  background:#FF5000;
  transform: rotate(-10deg) scale(1.1);
  box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.5);
}

.btn-whimsical:active {
  transform: rotate(0) scale(1);
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
}

/*WhishLite*/

    .btn {
        background: #FFC0CB;
        color: #FF5000;
        padding: 5px 20px;
        font-size: 1rem;
        font-weight: 600;
        border: none;
        border-radius: 50px;
        cursor: pointer;
        transition-duration: 0.4s;
    }

    .btn:hover {
        background: #FF5000;
        box-shadow: 0px 2px 20px 10px #97B1BF;
        color: #fff;
    }


    /*h2*/
    .brand{
        color: #ff0000;
    }
</style>


   <div class="single">
         <div class="wrap">
     	    <div class="rsidebar span_1_of_left">
				   <section  class="sky-form">
                   	  
                   	  <h2 class="brand">Popular Brands</h2>
						
                        <div class="row row1 scroll-pane">
                            <asp:Repeater ID="rptcategory" runat="server">
                                <ItemTemplate>
                                        <a href="filter_product.aspx?cat_id=<%#Eval("cat_id") %>" >
                                             <label class="checkbox" style="color: #FF5000;"><%#Eval("cat_name") %></label>
                                        </a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div> 
				  </section>
		</div>
       
           

		<div class="cont span_2_of_3">
			  <div class="labout span_1_of_a1">
				<!-- start product_slider -->

                  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                          <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                      </ol>
                      <div class="carousel-inner">

                          <div class="carousel-item" >

                              <ul id="etalage">
                                  <asp:Repeater ID="rptpro" runat="server">
                                      <ItemTemplate>

                                          <li>

                                              <img class="etalage_thumb_image" src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>"   />
                                              <img class="etalage_source_image" src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" />
                                              <%--  </a> <a href="optionallink.html">   <%# getActiveClass(Container.ItemIndex) %>--%>
                                          </li>


                                      </ItemTemplate>
                                  </asp:Repeater>
                              </ul>
                          </div>
                          </div>
                  </div>
				     
			<!-- end product_slider -->
			</div>


			<div class="cont1 span_2_of_a1">
                <asp:Repeater ID="rptprodata" runat="server" OnItemDataBound="rptprodata_ItemDataBound" OnDataBinding="rptprodata_DataBinding" OnItemCommand="rptprodata_ItemCommand">
                      <ItemTemplate>


                          <h1 style="font-size: 30px; color: #000;" class="m_3"><%#Eval("product_name") %></h1>


                          <div class="price_single">
                              <span class="actual" style="color:#ff0000;">₹. <%#Eval("product_price") %></span>
                          </div>
                          <ul class="options">
                              <h3> Available Size </h3>
                              <asp:RadioButtonList ID="radiosize" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" />

                          </ul>
                          <div class="btn_form" >
                              <form >
                                  <asp:Button ID="btnaddcart" runat="server" OnClick="btnaddcart_Click" CssClass="btn-whimsical"  Text="🛒Add To Cart" /> 
                                  <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                              </form>
                          </div>
                          <ul class="add-to-links">
                              <li>
                                  <asp:LinkButton ID="lbwishlist" runat="server" OnClick="lbwishlist_Click" CssClass="btn"  Text="❤️Add to Wishlist" ></asp:LinkButton>
                                  <%--<img src="images/wish.png" alt="" /><a href="#">Add to wishlist</a></li>--%>
                          </ul>
                          <p class="m_desc"><%#Eval("product_description") %> </p>
<div>

</div>
                          <div class="social_single" >
                              <ul>
                                  <li class="fb"><a href="#"><span></span></a></li>
                                  <li class="tw"><a href="#"><span></span></a></li>
                                  <li class="g_plus"><a href="#"><span></span></a></li>
                                  <li class="rss"><a href="#"><span></span></a></li>
                              </ul>
                          </div>

                      </ItemTemplate>
                                  </asp:Repeater>
			</div>
             
			<div class="clear"></div>
     
     
         <ul id="flexiselDemo3">
                <asp:Repeater ID="rptreleatedproduct" runat="server">
                    <ItemTemplate>
                        <li>
                            <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                                <img src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" />
                                <div class="grid-flex">
                                    <%#Eval("product_name") %>
                                    <p><%#Eval("product_price") %></p>
                                </div>
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
	    <script type="text/javascript">
	        $(window).load(function () {
	            $("#flexiselDemo1").flexisel();
	            $("#flexiselDemo2").flexisel({
	                enableResponsiveBreakpoints: true,
	                responsiveBreakpoints: {
	                    portrait: {
	                        changePoint: 480,
	                        visibleItems: 1
	                    },
	                    landscape: {
	                        changePoint: 640,
	                        visibleItems: 2
	                    },
	                    tablet: {
	                        changePoint: 768,
	                        visibleItems: 3
	                    }
	                }
	            });

	            $("#flexiselDemo3").flexisel({
	                visibleItems: 5,
	                animationSpeed: 1000,
	                autoPlay: true,
	                autoPlaySpeed: 3000,
	                pauseOnHover: true,
	                enableResponsiveBreakpoints: true,
	                responsiveBreakpoints: {
	                    portrait: {
	                        changePoint: 480,
	                        visibleItems: 1
	                    },
	                    landscape: {
	                        changePoint: 640,
	                        visibleItems: 2
	                    },
	                    tablet: {
	                        changePoint: 768,
	                        visibleItems: 3
	                    }
	                }
	            });

	        });
	</script>
	<script type="text/javascript" src="js/jquery.flexisel.js"></script>
	 					
	 
     </div>
     <div class="clear"></div>
	 </div>
     </div>
</asp:Content>

