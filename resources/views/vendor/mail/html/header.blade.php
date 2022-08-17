<tr>
<td class="header">
<a href=" /" style="display: inline-block;">
@if (trim($slot) === 'Laravel')
<img src=" /images/Logo-Web.jpg" class="logo" alt="Luberef Logo">
@else
{{ $slot }}
@endif
</a>
</td>
</tr>
