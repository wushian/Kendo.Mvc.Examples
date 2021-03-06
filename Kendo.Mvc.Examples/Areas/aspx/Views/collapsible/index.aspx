﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<% Html.Kendo().MobileView()
        .Name("football-results")        
        .Title("Collapsible index")
        .Content(() =>
        {
            %>
            
            <div class="hero">PREMIER LEAGUE</div>

            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/mancity.png' alt='Man City' /> Man City</span><span class='result'>2-0</span><span class='team-two'>Leicester <img src='/content/mobile/football/leicester.png' alt='Leicester' /></span>")
                .Content("<table class='match-details'><tr><td>D.Silva <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>45+2'</td><td>&nbsp;</td></tr><tr><td>J.Milner <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>88'</td><td>&nbsp;</td></tr></table>")
                .Render();
            %>
            
            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/newcastle.png' alt='Newcastle' /> Newcastle</span><span class='result'>0-1</span><span class='team-two'>Man Utd <img src='/content/mobile/football/manutd.png' alt='Man Utd' /></span>")
                .Content("<table class='match-details'><tr><td>&nbsp;</td><td>89'</td><td><img src='/content/mobile/football/ball.png' alt='Goal' /> A.Young</td></tr></table>")
                .Render();
            %>
            
            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/tottenham.png' alt='Tottenham' /> Tottenham</span><span class='result'>3-2</span><span class='team-two'>Swansea <img src='/content/mobile/football/swansea.png' alt='Swansea' /></span>")
                .Content("<table class='match-details'><tr><td>N.Chadli <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>7'</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>19'</td><td><img src='/content/mobile/football/ball.png' alt='Goal' /> Ki Sung-yueng</td></tr><tr><td>R.Mason <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>51'</td><td>&nbsp;</td></tr><tr><td>A.Townsend <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>60'</td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td>89'</td><td><img src='/content/mobile/football/ball.png' alt='Goal' /> G.Sigurdsson</td></tr></table>")
                .Render();
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/westham.png' alt='West Ham' />West Ham</span><span class='result'>0-1</span><span class='team-two'>Chelsea <img src='/content/mobile/football/chelsea.png' alt='Chelsea' /></span>")
                .Content("<table class='match-details'><tr><td>&nbsp;</td><td>22'</td><td><img src='/content/mobile/football/ball.png' alt='Goal' /> E.Hazard</td></tr></table>")
                .Render();
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/liverpool.png' alt='Liverpool' />Liverpool</span><span class='result'>2-0</span><span class='team-two'>Burnley <img src='/content/mobile/football/burnley.png' alt='Burnley' /></span>")
                .Content("<table class='match-details'><tr><td>J.Henderson <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>29'</td><td>&nbsp;</td></tr><tr><td>D.Sturridge <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>51'</td><td>&nbsp;</td></tr></table>")
                .Collapsed(false)
                .Render();
            %>

            <% Html.Kendo().MobileCollapsible()
                .Header("<span class='team-one'><img src='/content/mobile/football/stoke.png' alt='Stoke' />Stoke</span><span class='result'>2-0</span><span class='team-two'>Everton <img src='/content/mobile/football/everton.png' alt='Everton' /></span>")
                .Content("<table class='match-details'><tr><td>V.Moses <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>32'</td><td>&nbsp;</td></tr><tr><td>M.Diouf <img src='/content/mobile/football/ball.png' alt='Goal' /></td><td>84'</td><td>&nbsp;</td></tr></table>")
                .IconPosition(IconPosition.Right)
                .Render();
            %>
            <%
        })
        .Render();
%>

<style>
    #football-results .hero {
        display: block;
        margin: 0;
        padding-left: .5em;
        height: 110px;
        line-height: 110px;
        font-size: 18px;
        color: rgba(255,255,255,.85);
        text-align: center;
        text-transform: uppercase;
        letter-spacing: .2em;
        background: url(../content/mobile/shared/grass.jpg) no-repeat center center;
        -webkit-background-size: 100% auto;
        background-size: 100% auto;
    }
    #football-results h3 {
        padding: 0;
        text-align: center;
        font-size: 14px;
    }
    #football-results h3 .km-icon {
        font-size: 1em;
    }
    #football-results h3 .result {
        display: inline-block;
        width: 24px;
    }
    #football-results h3 .team-one,
    #football-results h3 .team-two {
        display: inline-block;
        width: 98px;
        text-align: right;
        font-weight: normal
    }
    #football-results h3 .team-two {
        text-align: left;
    }
    #football-results h3 .team-one img,
    #football-results h3 .team-two img {
        width: 16px;
        vertical-align: middle;
        float: left;
    }
    #football-results h3 .team-two img {
        float: right;
    }    .match-details {
        width: 100%;
        text-align: center;
    }
    .match-details img {
        width: 10px;
    }
    .match-details td {
        width: 20%;
    }
    .match-details td:first-child,
    .match-details td:last-child {
        width: 40%;
        text-align: right;
    }
    .match-details td:last-child {
        text-align: left;
    }
</style>

</asp:Content>