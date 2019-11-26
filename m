Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZUtd-0005DU-6x
	for mharc-qemu-trivial@gnu.org; Tue, 26 Nov 2019 02:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1iZToa-0004y7-30
 for qemu-trivial@nongnu.org; Tue, 26 Nov 2019 00:55:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1iZToX-0007dk-3u
 for qemu-trivial@nongnu.org; Tue, 26 Nov 2019 00:55:06 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:53835
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1iZToW-0007cg-KQ
 for qemu-trivial@nongnu.org; Tue, 26 Nov 2019 00:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574747703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PhagN+LBgF+cj4p9K3LtyIxiU2ITBstkjXlWHpHb+AU=;
 b=UycfruJX1/7POC57MsnQoaXabNWePw77+p7k1CfLuqAE0keO51JzbQwq3NwtlhnSnelaaC
 XTmMnlsuTmIODjQfY5GZlxPteKDEpXwU85gsWpkeNwmKdbs+MgZVQ/yej9x7nDhkeFjrQX
 8zU/QniX3w+mCmFCCyJMi/wOXx0w3ko=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-xqRWOQKdO9-whwgPVdWcjg-1; Tue, 26 Nov 2019 00:55:00 -0500
Received: by mail-ot1-f69.google.com with SMTP id h15so9456314otr.11
 for <qemu-trivial@nongnu.org>; Mon, 25 Nov 2019 21:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=vEWh+2J5jrBt1wzRP2+XNoxibqPg4eFFJY9s/gJMNv4=;
 b=rHXHmB5UFpBt6YkzXw7qDvxPpeqU4b+n5mBVwzfB9ohNTxN7Ri44GGa83BxnSX1HNc
 leoot9sD9N3l2qwoXmcPFq4OP/OodpFbmm4vtDwl+9ubz80H7SS0jtc49Hj3qeCq6UEx
 jd/xszR8BFE5Rgz5VlrTHs4whQQVMxz3zoWEREBjk/OnxYEgPUe97pjiAg9kI050UChH
 lJ6qJDlF0NWCsFE2QOJZCjAIu4JuN41qG6w4uyglZQphFQq4spRYA+vLSD1zIY4MnzA1
 Zl70r0d0YFqqS//JiS0MY6NsVPm7dsKySrvUOAylJ+TiodL0eLO70Nb6v38l0R180Ev8
 3G6Q==
X-Gm-Message-State: APjAAAW6kT1G8TdIVRxmOQdjdwxLMGVSXnt/xE5UaB8Urqyt6koZ5DWP
 BZ1YagzUhON9X+uZHW4BSiBD3ZTS+bRFhAX8BtTnVgdLwLq8flHww2wQZISD3cfo/um7B8ZezRO
 8u1folaUGnvIASUCIyDuGnKA6wwab18peCg==
X-Received: by 2002:a05:6830:19a:: with SMTP id
 q26mr1131377ota.370.1574747700154; 
 Mon, 25 Nov 2019 21:55:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqx4/dretCEBKQb3+/NqaZyYMEfhkJUx6rPCgsBLON7pMZXugWPyySRo5ksxZELfkIgBulCToOhw6Qz36OiBwvY=
X-Received: by 2002:a05:6830:19a:: with SMTP id
 q26mr1131373ota.370.1574747699941; 
 Mon, 25 Nov 2019 21:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20191113131655.307847-1-hhan@redhat.com>
In-Reply-To: <20191113131655.307847-1-hhan@redhat.com>
From: Han Han <hhan@redhat.com>
Date: Tue, 26 Nov 2019 13:54:30 +0800
Message-ID: <CAHjf+S_miSm8ygAadObVnif1LKejA=j9OFae+OV5Oe-TedByyQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: Fix undefinited name 'file' error for python3
To: qemu-trivial@nongnu.org
X-MC-Unique: xqRWOQKdO9-whwgPVdWcjg-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="0000000000004431720598398503"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-Mailman-Approved-At: Tue, 26 Nov 2019 02:04:20 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2019 05:55:09 -0000

--0000000000004431720598398503
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Nov 13, 2019 at 9:17 PM Han Han <hhan@redhat.com> wrote:

> In python3, 'file' is no longer a keyword for file type object. So it
> will can error when run the scripts by python3:
>
> $ python3 ./scripts/vmstate-static-checker.py -s 4.0.json -d 4.1.json
> Traceback (most recent call last):
>   File "./scripts/vmstate-static-checker.py", line 431, in <module>
>     sys.exit(main())
>   File "./scripts/vmstate-static-checker.py", line 378, in main
>     parser.add_argument('-s', '--src', type=3Dfile, required=3DTrue,
> NameError: name 'file' is not defined
>
> Replace file type to argparse.FileType('r').
>
> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>  scripts/vmstate-static-checker.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/vmstate-static-checker.py
> b/scripts/vmstate-static-checker.py
> index d3467288..14f199a0 100755
> --- a/scripts/vmstate-static-checker.py
> +++ b/scripts/vmstate-static-checker.py
> @@ -375,9 +375,9 @@ def main():
>      help_text =3D "Parse JSON-formatted vmstate dumps from QEMU in files
> SRC and DEST.  Checks whether migration from SRC to DEST QEMU versions
> would break based on the VMSTATE information contained within the JSON
> outputs.  The JSON output is created from a QEMU invocation with the
> -dump-vmstate parameter and a filename argument to it.  Other parameters =
to
> QEMU do not matter, except the -M (machine type) parameter."
>
>      parser =3D argparse.ArgumentParser(description=3Dhelp_text)
> -    parser.add_argument('-s', '--src', type=3Dfile, required=3DTrue,
> +    parser.add_argument('-s', '--src', type=3Dargparse.FileType('r'),
> required=3DTrue,
>                          help=3D'json dump from src qemu')
> -    parser.add_argument('-d', '--dest', type=3Dfile, required=3DTrue,
> +    parser.add_argument('-d', '--dest', type=3Dargparse.FileType('r'),
> required=3DTrue,
>                          help=3D'json dump from dest qemu')
>      parser.add_argument('--reverse', required=3DFalse, default=3DFalse,
>                          action=3D'store_true',
> --
> 2.23.0
>
>

--=20
Best regards,
-----------------------------------
Han Han
Quality Engineer
Redhat.

Email: hhan@redhat.com
Phone: +861065339333

--0000000000004431720598398503
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Nov 13, 2019 at 9:17 PM Han Han &lt;<a hre=
f=3D"mailto:hhan@redhat.com">hhan@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">In python3, &#39;file&#39; is n=
o longer a keyword for file type object. So it<br>
will can error when run the scripts by python3:<br>
<br>
$ python3 ./scripts/vmstate-static-checker.py -s 4.0.json -d 4.1.json<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;./scripts/vmstate-static-checker.py&quot;, line 431, in &=
lt;module&gt;<br>
=C2=A0 =C2=A0 sys.exit(main())<br>
=C2=A0 File &quot;./scripts/vmstate-static-checker.py&quot;, line 378, in m=
ain<br>
=C2=A0 =C2=A0 parser.add_argument(&#39;-s&#39;, &#39;--src&#39;, type=3Dfil=
e, required=3DTrue,<br>
NameError: name &#39;file&#39; is not defined<br>
<br>
Replace file type to argparse.FileType(&#39;r&#39;).<br>
<br>
Signed-off-by: Han Han &lt;<a href=3D"mailto:hhan@redhat.com" target=3D"_bl=
ank">hhan@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/vmstate-static-checker.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-che=
cker.py<br>
index d3467288..14f199a0 100755<br>
--- a/scripts/vmstate-static-checker.py<br>
+++ b/scripts/vmstate-static-checker.py<br>
@@ -375,9 +375,9 @@ def main():<br>
=C2=A0 =C2=A0 =C2=A0help_text =3D &quot;Parse JSON-formatted vmstate dumps =
from QEMU in files SRC and DEST.=C2=A0 Checks whether migration from SRC to=
 DEST QEMU versions would break based on the VMSTATE information contained =
within the JSON outputs.=C2=A0 The JSON output is created from a QEMU invoc=
ation with the -dump-vmstate parameter and a filename argument to it.=C2=A0=
 Other parameters to QEMU do not matter, except the -M (machine type) param=
eter.&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0parser =3D argparse.ArgumentParser(description=3Dhelp_t=
ext)<br>
-=C2=A0 =C2=A0 parser.add_argument(&#39;-s&#39;, &#39;--src&#39;, type=3Dfi=
le, required=3DTrue,<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;-s&#39;, &#39;--src&#39;, type=3Dar=
gparse.FileType(&#39;r&#39;), required=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&#39;json dump from src qemu&#39;)<br>
-=C2=A0 =C2=A0 parser.add_argument(&#39;-d&#39;, &#39;--dest&#39;, type=3Df=
ile, required=3DTrue,<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;-d&#39;, &#39;--dest&#39;, type=3Da=
rgparse.FileType(&#39;r&#39;), required=3DTrue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0help=3D&#39;json dump from dest qemu&#39;)<br>
=C2=A0 =C2=A0 =C2=A0parser.add_argument(&#39;--reverse&#39;, required=3DFal=
se, default=3DFalse,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0action=3D&#39;store_true&#39;,<br>
-- <br>
2.23.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
">Best regards,</div><div dir=3D"ltr">-----------------------------------<b=
r></div><div dir=3D"ltr">Han Han<br>Quality Engineer<br>Redhat.<br><br>Emai=
l: <a href=3D"mailto:hhan@redhat.com" target=3D"_blank">hhan@redhat.com</a>=
<br>Phone: +861065339333<br></div></div></div></div></div></div>

--0000000000004431720598398503--


