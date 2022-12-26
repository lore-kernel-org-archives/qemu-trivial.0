Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p9o3q-0006tE-VG
	for mharc-qemu-trivial@gnu.org; Mon, 26 Dec 2022 09:02:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o3m-0006qd-9f
 for qemu-trivial@nongnu.org; Mon, 26 Dec 2022 09:02:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p9o3j-0007Pn-Sv
 for qemu-trivial@nongnu.org; Mon, 26 Dec 2022 09:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672063348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B/UO1YTQIsQZfs9+37Ab8KH3k61CDlWj56JLHb1YTWM=;
 b=fOArLyKCo2dmimndBKAZ4f501RVbdGsa3Mvm6x5mOzRsgPRV2R5a7dDQrrESYF6Pr37PCg
 uVa2wjoSnn90xUSnXaWXk5F3/w9OCK5IUPyDssDWaVQjbGVnUH38blROjbQo4DMGrenc8O
 J9P0NZpMIZIDGmAwyQ1Ca+TTy2MU7pQ=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-205-jh4TCnrBMMqlVroauy_Q-g-1; Mon, 26 Dec 2022 09:02:26 -0500
X-MC-Unique: jh4TCnrBMMqlVroauy_Q-g-1
Received: by mail-vs1-f69.google.com with SMTP id
 l62-20020a677041000000b003aa06a96e75so2738568vsc.5
 for <qemu-trivial@nongnu.org>; Mon, 26 Dec 2022 06:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B/UO1YTQIsQZfs9+37Ab8KH3k61CDlWj56JLHb1YTWM=;
 b=fq+HRrbGdddLO9zfFzSAFssJGixSWLiWB1ey9KrFmWUWLMsDYPecZh4Gppr/w3EpeU
 5WJejXyvHC05uRQjw6JPxVhmIT/AkdlPMttmVTHWGw1AtjF/kfAt5O9mAMu+TyvKUSMe
 V+OSxPs4Zma6Qx54TK+kLjGPJJ5M+UHBR1qWaK2ktVFpTsmxpVJWqgv/uRJ/1zgn3VDm
 o8iF7j+3I9w3MO5h7nO0VjVhziod8VMvn1HF89lhjLTr2KpjLsZanWs2hWwfAffIJSyQ
 BpVtiXN/ZjRQypQF41OqQOPEOyrLM5WmADBrZbYGMePi+CHTeLFZxGhM4R9bQiw/yK6H
 hntQ==
X-Gm-Message-State: AFqh2krND7VtH4rGSaI7RXR/2XRfNRX3wXuZNAM9eXKQklMOoLi2ICui
 hZxGuYQ1kUd4byw8RsNQYZ4JTKY0VUCxameOoIK+tTcGopgpkgfdkGaDQb0Fko/fA1Cw9QkcmIE
 E3IcMG60V64ntwNnuKgHheBMUNqhf6aYvNg==
X-Received: by 2002:a05:6102:5792:b0:3b5:3f84:287 with SMTP id
 dh18-20020a056102579200b003b53f840287mr2271024vsb.66.1672063345896; 
 Mon, 26 Dec 2022 06:02:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv736eAgejVzb0ZNM8YSktx2+RfZfsULGWVXmNB8n99mgtbP+iP0onpGbdQXDDJcTue5g8IQh6U57lD68RYV54=
X-Received: by 2002:a05:6102:5792:b0:3b5:3f84:287 with SMTP id
 dh18-20020a056102579200b003b53f840287mr2271022vsb.66.1672063345487; Mon, 26
 Dec 2022 06:02:25 -0800 (PST)
MIME-Version: 1.0
References: <20221213151343.90235-1-andrey.drobyshev@virtuozzo.com>
 <CAPMcbCoo_H7PW5iOnyxHpTaWiZWtZNKjZUrFPtxZgtmAktC+bg@mail.gmail.com>
In-Reply-To: <CAPMcbCoo_H7PW5iOnyxHpTaWiZWtZNKjZUrFPtxZgtmAktC+bg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 26 Dec 2022 16:02:14 +0200
Message-ID: <CAPMcbCow3qS2ozFNzOh=8Ap5fh1jTkZrzHdnMW29zibs69y_jQ@mail.gmail.com>
Subject: Re: [PATCH v2] qga-win: choose the right libpcre version to include
 in MSI package
To: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, den@virtuozzo.com, 
 sw@weilnetz.de
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c008c405f0bb95ee"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Dec 2022 14:02:36 -0000

--000000000000c008c405f0bb95ee
Content-Type: text/plain; charset="UTF-8"

the series was merged

Best Regards,
Konstantin Kostiuk.


On Tue, Dec 13, 2022 at 9:20 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> Tested-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> On Tue, Dec 13, 2022 at 5:13 PM Andrey Drobyshev <
> andrey.drobyshev@virtuozzo.com> wrote:
>
>> According to GLib changelog [1], since version 2.73.2 GLib is using
>> libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
>> fails due to missing DLL when linked with the newer GLib.
>>
>> This commit makes wixl to put the right libpcre version into the MSI
>> bundle: either libpcre-1.dll or libpcre2-8-0.dll, depending on the
>> present version of GLib.
>>
>> [1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2
>>
>> Previous version:
>> https://lists.nongnu.org/archive/html/qemu-trivial/2022-11/msg00237.html
>>
>> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
>> ---
>>  qga/installer/qemu-ga.wxs | 12 +++++++++---
>>  qga/meson.build           |  6 ++++++
>>  2 files changed, 15 insertions(+), 3 deletions(-)
>>
>> diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
>> index e344c38e74..9f0bacae81 100644
>> --- a/qga/installer/qemu-ga.wxs
>> +++ b/qga/installer/qemu-ga.wxs
>> @@ -101,9 +101,15 @@
>>            <Component Id="libwinpthread"
>> Guid="{6C117C78-0F47-4B07-8F34-6BEE11643829}">
>>              <File Id="libwinpthread_1.dll" Name="libwinpthread-1.dll"
>> Source="$(var.BIN_DIR)/libwinpthread-1.dll" KeyPath="yes" DiskId="1"/>
>>            </Component>
>> -          <Component Id="libpcre"
>> Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
>> -            <File Id="libpcre_1.dll" Name="libpcre-1.dll"
>> Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
>> -          </Component>
>> +          <?if $(var.LIBPCRE) = "libpcre1"?>
>> +            <Component Id="libpcre"
>> Guid="{7A86B45E-A009-489A-A849-CE3BACF03CD0}">
>> +              <File Id="libpcre_1.dll" Name="libpcre-1.dll"
>> Source="$(var.BIN_DIR)/libpcre-1.dll" KeyPath="yes" DiskId="1"/>
>> +            </Component>
>> +          <?else?>
>> +            <Component Id="libpcre"
>> Guid="{F92A3804-B59C-419D-8F29-99A30352C156}">
>> +              <File Id="libpcre2_8_0.dll" Name="libpcre2-8-0.dll"
>> Source="$(var.BIN_DIR)/libpcre2-8-0.dll" KeyPath="yes" DiskId="1"/>
>> +            </Component>
>> +          <?endif?>
>>            <Component Id="registry_entries"
>> Guid="{D075D109-51CA-11E3-9F8B-000C29858960}">
>>              <RegistryKey Root="HKLM"
>>
>> Key="Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QEMU_GA_DISTRO)\Tools\QemuGA">
>> diff --git a/qga/meson.build b/qga/meson.build
>> index 1ff159edc1..ad17dc7dca 100644
>> --- a/qga/meson.build
>> +++ b/qga/meson.build
>> @@ -140,6 +140,11 @@ if targetos == 'windows'
>>        qemu_ga_msi_vss = ['-D', 'InstallVss']
>>        deps += qga_vss
>>      endif
>> +    if glib.version() < '2.73.2'
>> +      libpcre = 'libpcre1'
>> +    else
>> +      libpcre = 'libpcre2'
>> +    endif
>>      qga_msi = custom_target('QGA MSI',
>>                              input: files('installer/qemu-ga.wxs'),
>>                              output: 'qemu-ga-@0@.msi'.format(host_arch),
>> @@ -153,6 +158,7 @@ if targetos == 'windows'
>>                                '-D', 'QEMU_GA_VERSION=' +
>> config_host['QEMU_GA_VERSION'],
>>                                '-D', 'QEMU_GA_MANUFACTURER=' +
>> config_host['QEMU_GA_MANUFACTURER'],
>>                                '-D', 'QEMU_GA_DISTRO=' +
>> config_host['QEMU_GA_DISTRO'],
>> +                              '-D', 'LIBPCRE=' + libpcre,
>>                              ])
>>      all_qga += [qga_msi]
>>      alias_target('msi', qga_msi)
>> --
>> 2.34.3
>>
>>

--000000000000c008c405f0bb95ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>the series was merged</div><div><br></div><div><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstantin Kostiuk.</div></=
div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Dec 13, 2022 at 9:20 PM Konstantin Kostiu=
k &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@r=
edhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><div>Tested-b=
y: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com" target=3D"=
_blank">kkostiuk@redhat.com</a>&gt;</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 13, 2022 at 5:13 PM An=
drey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev@virtuozzo.com" target=
=3D"_blank">andrey.drobyshev@virtuozzo.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">According to GLib changelog [1], =
since version 2.73.2 GLib is using<br>
libpcre2 instead of libpcre.=C2=A0 As a result, qemu-ga MSI installation<br=
>
fails due to missing DLL when linked with the newer GLib.<br>
<br>
This commit makes wixl to put the right libpcre version into the MSI<br>
bundle: either libpcre-1.dll or libpcre2-8-0.dll, depending on the<br>
present version of GLib.<br>
<br>
[1] <a href=3D"https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/glib/-/rel=
eases#2.73.2</a><br>
<br>
Previous version:<br>
<a href=3D"https://lists.nongnu.org/archive/html/qemu-trivial/2022-11/msg00=
237.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.org/arc=
hive/html/qemu-trivial/2022-11/msg00237.html</a><br>
<br>
Signed-off-by: Andrey Drobyshev &lt;<a href=3D"mailto:andrey.drobyshev@virt=
uozzo.com" target=3D"_blank">andrey.drobyshev@virtuozzo.com</a>&gt;<br>
---<br>
=C2=A0qga/installer/qemu-ga.wxs | 12 +++++++++---<br>
=C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++=
+++<br>
=C2=A02 files changed, 15 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs<br>
index e344c38e74..9f0bacae81 100644<br>
--- a/qga/installer/qemu-ga.wxs<br>
+++ b/qga/installer/qemu-ga.wxs<br>
@@ -101,9 +101,15 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;libwinpth=
read&quot; Guid=3D&quot;{6C117C78-0F47-4B07-8F34-6BEE11643829}&quot;&gt;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;File Id=3D&quot;libwinp=
thread_1.dll&quot; Name=3D&quot;libwinpthread-1.dll&quot; Source=3D&quot;$(=
var.BIN_DIR)/libwinpthread-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&=
quot;1&quot;/&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/Component&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;Component Id=3D&quot;libpcre&quot; =
Guid=3D&quot;{7A86B45E-A009-489A-A849-CE3BACF03CD0}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libpcre_1.dl=
l&quot; Name=3D&quot;libpcre-1.dll&quot; Source=3D&quot;$(var.BIN_DIR)/libp=
cre-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/Component&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;?if $(var.LIBPCRE) =3D &quot;libpcr=
e1&quot;?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;Component Id=3D&quot;libpcre=
&quot; Guid=3D&quot;{7A86B45E-A009-489A-A849-CE3BACF03CD0}&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libpc=
re_1.dll&quot; Name=3D&quot;libpcre-1.dll&quot; Source=3D&quot;$(var.BIN_DI=
R)/libpcre-1.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&quot;/&gt=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/Component&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;?else?&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;Component Id=3D&quot;libpcre=
&quot; Guid=3D&quot;{F92A3804-B59C-419D-8F29-99A30352C156}&quot;&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;File Id=3D&quot;libpc=
re2_8_0.dll&quot; Name=3D&quot;libpcre2-8-0.dll&quot; Source=3D&quot;$(var.=
BIN_DIR)/libpcre2-8-0.dll&quot; KeyPath=3D&quot;yes&quot; DiskId=3D&quot;1&=
quot;/&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/Component&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;?endif?&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;Component Id=3D&quot;registry_=
entries&quot; Guid=3D&quot;{D075D109-51CA-11E3-9F8B-000C29858960}&quot;&gt;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;RegistryKey Root=3D&quo=
t;HKLM&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Key=3D&quot;Software\$(var.QEMU_GA_MANUFACTURER)\$(var.QE=
MU_GA_DISTRO)\Tools\QemuGA&quot;&gt;<br>
diff --git a/qga/meson.build b/qga/meson.build<br>
index 1ff159edc1..ad17dc7dca 100644<br>
--- a/qga/meson.build<br>
+++ b/qga/meson.build<br>
@@ -140,6 +140,11 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_ga_msi_vss =3D [&#39;-D&#39;, &#39;InstallV=
ss&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0deps +=3D qga_vss<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
+=C2=A0 =C2=A0 if glib.version() &lt; &#39;2.73.2&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 libpcre =3D &#39;libpcre1&#39;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 libpcre =3D &#39;libpcre2&#39;<br>
+=C2=A0 =C2=A0 endif<br>
=C2=A0 =C2=A0 =C2=A0qga_msi =3D custom_target(&#39;QGA MSI&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input: files(&#39;installer/qemu-ga.wxs&#39;=
),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output: &#39;qemu-ga-@0@.msi&#39;.format(hos=
t_arch),<br>
@@ -153,6 +158,7 @@ if targetos =3D=3D &#39;windows&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_VERSION=3D=
&#39; + config_host[&#39;QEMU_GA_VERSION&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_MANUFACTUR=
ER=3D&#39; + config_host[&#39;QEMU_GA_MANUFACTURER&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-D&#39;, &#39;QEMU_GA_DISTRO=3D&=
#39; + config_host[&#39;QEMU_GA_DISTRO&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-D&#39;, &#39;LIBPCRE=3D&#39; + libpcr=
e,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0])<br>
=C2=A0 =C2=A0 =C2=A0all_qga +=3D [qga_msi]<br>
=C2=A0 =C2=A0 =C2=A0alias_target(&#39;msi&#39;, qga_msi)<br>
-- <br>
2.34.3<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000c008c405f0bb95ee--


