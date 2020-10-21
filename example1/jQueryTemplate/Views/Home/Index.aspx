<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>jQuery Template Example</title>
    <link type="text/css" rel="stylesheet"
        href="<%=Url.Content("~/Content/Site.css") %>" />
    <script type="text/javascript"
        src="<%=Url.Content("~/Scripts/jquery-1.9.1.min.js")%>"></script>
    <script type="text/javascript"
        src="<%=Url.Content("~/Scripts/jquery.tmpl.min.js")%>"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var addCheckBoxesToDom = function (chkBxData) {
            var div = $('#divCheckBoxes');
            div.html($('#checkBoxTemplate').tmpl(chkBxData));

            $('a.toggle', div).click(function () {
                var t = $(this);
                var ul = t.closest('li').children('ul');

                if (t.hasClass('opened')) {
                    t.removeClass('opened');
                    ul.hide();
                } else {
                    t.addClass('opened');
                    ul.show();
                }

                return false;
            });
        };

        $('#btnLoadCheckBoxes').click(function () {
            var url = '<%=Url.Action("GetCheckBoxesData", "Home") %>';

            $.ajax({
                url: url,
                type: "POST",
                cache: false
            }).done(function (data) {
                var chkBxData = { items: data };
                addCheckBoxesToDom(chkBxData);
            });
        });

        $('#btnClearCheckBoxes').click(function () {
            $('#divCheckBoxes').html('');
        });
    });
</script>
</head>

<body>
<div>
    <div style="width: 450px">
        <div>
            <span><a id="btnLoadCheckBoxes" href="#" class="linkbutton">
                      Load checkboxes</a></span>
            <span><a id="btnClearCheckBoxes" href="#" class="linkbutton">
                      Clear checkboxes</a></span>
        </div>
        <div id="divCheckBoxes" />
    </div>
</div>
</body>

<script id="checkBoxTemplate" type="text/html">
<ul>
{{each items}}
    <li>
    <span>
    {{if Children.length > 0}}<a href="#" class="toggle" />{{/if}}
    <label{{if Children.length == 0}} class="static"{{/if}}>
        <input type="checkbox" id="ck${Id}"{{if Checked}}
        checked="checked"{{/if}} />[${Id}]-${Text}</label>
    </span>
        {{if Children.length > 0}}
        <ul style="display: none">
        {{each Children}}
        <li>
        <span class="tierTwo">
            {{if Children.length > 0}}<a href="#" class="toggle" />{{/if}}
            <label{{if Children.length == 0}} class="static"{{/if}}>
                <input type="checkbox" id="ck${Id}"{{if Checked}}
                checked="checked"{{/if}} />[${Id}]-${Text}</label>
        </span>
            {{if Children.length > 0}}
            <ul style="display: none">
            {{each Children}}
            <li>
            <span class="tierThree">
                <label><input type="checkbox" id="ck${Id}"{{if Checked}}
                    checked="checked"{{/if}} />[${Id}]-${Text}</label>
            </span>
            </li>
            {{/each}}
            </ul>
            {{/if}}
    </li>
    {{/each}}
    </ul>
    {{/if}}
    </li>
{{/each}}
</ul>
</script>

</html>
