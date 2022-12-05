Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p2CNb-0001Zm-Ek
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2022 09:23:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1p25tQ-00009w-3S
 for qemu-trivial@nongnu.org; Mon, 05 Dec 2022 02:28:03 -0500
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1p25tN-0006Ve-KD
 for qemu-trivial@nongnu.org; Mon, 05 Dec 2022 02:27:59 -0500
Received: by mail-ua1-x934.google.com with SMTP id 97so3632904uam.0
 for <qemu-trivial@nongnu.org>; Sun, 04 Dec 2022 23:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spootnik-org.20210112.gappssmtp.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NFj9JzMxET4JuwYsA9SoLEEUFTyQMQvj7IJf2l90eKE=;
 b=trkn1VnevCLvjhGtVSpwN1Ymgaa9i2RRPMArGt2pKOM6y11EdRzJTlOFHs1lZYtq8i
 CwXXngw6FO3+BREiY9vOz3v2YvSSy1GD6R9hQSB0L1V45jkLn1lQq1RgJXSPg+lnj2X3
 ieouORQ05CdQpcimENAjlDPJiitBY120tBFj38VWRP4b+0MivCnAYDcwCFOkcEpWjabb
 +GVwEYVWXjbv7ULssyK/uAznI7X6UKGzDvEax27MTt4BEIWwdJ/7BZOti2QGT/55oZxx
 rPvLw01RsBaB1G02Dd1fp/xcEIUra+cpKhD6s5iDan7AHRFXSX5YivgRl28k7IqchT3N
 Up3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NFj9JzMxET4JuwYsA9SoLEEUFTyQMQvj7IJf2l90eKE=;
 b=xo6eCcy7TmGEA7D/vS0KbcdJ3GYKMmzxnjDSV92abG0tjMf2if6He3cFzJxamY0Upy
 KLHbPp6i/qDQ22Ipj819j8hO0SHDlEXlCVB1G27GIVPn4BTEZ/CG4GXGFEwa7CBvb1nj
 0XNmNTXbucoYTooShujcTaCyxucYCq3CbbpWX9pAxB0/GjC9rFwqcFU6JKDnx+IeEXs5
 Na/VAgNkvyAe+fa70eQEfrFgJCqfpkQTkl9oz7n+IqJczOqsI+9FNqlvmnZicNUTITQ8
 rYWwr3z/1nra8qfLb8ik3YhwTUBBn6Yi4I4MhJw7L4K177OyLueALSJ3Q5eqXiKFQll+
 Cydg==
X-Gm-Message-State: ANoB5pniMhmQ2ZbgWMZ08IbRnsluZb84cyfTUOD/Lk9kS5+NFQIJw1Wc
 xwOdV0EbQdUlRocncoYucV9Twc5fenAQxVQaToILYAxwc8BP4UBQhyk=
X-Google-Smtp-Source: AA0mqf4vgrYp6BZtEpSv4V0vxdsGqgEg+/7+KpmzF8WMBzYmF583pL4A6h0KMCI7p1VL45H8d2htw4aeuAmv4CDwa+w=
X-Received: by 2002:ab0:4986:0:b0:414:4bb5:3e54 with SMTP id
 e6-20020ab04986000000b004144bb53e54mr37577284uad.121.1670225275437; Sun, 04
 Dec 2022 23:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20221202151202.24851-1-pyr@spootnik.org>
In-Reply-To: <20221202151202.24851-1-pyr@spootnik.org>
From: Pierre-Yves Ritschard <pyr@spootnik.org>
Date: Mon, 5 Dec 2022 08:27:44 +0100
Message-ID: <CAJwCgu9L4PrkEUymRGfiZLbzP-Rpn0gYoYih3HUptG474XJTxg@mail.gmail.com>
Subject: Fwd: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX
 sockets
To: qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003cd72005ef0fa096"
Received-SPF: none client-ip=2607:f8b0:4864:20::934;
 envelope-from=pyr@spootnik.org; helo=mail-ua1-x934.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 05 Dec 2022 09:23:33 -0500
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
X-List-Received-Date: Mon, 05 Dec 2022 07:28:04 -0000

--0000000000003cd72005ef0fa096
Content-Type: text/plain; charset="UTF-8"

I forgot to publish the patch here

---------- Forwarded message ---------
From: Pierre-Yves Ritschard <pyr@spootnik.org>
Date: Fri, Dec 2, 2022 at 4:12 PM
Subject: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
To: Gerd Hoffmann <kraxel@redhat.com>, <qemu-devel@nongnu.org>
Cc: Pierre-Yves Ritschard <pyr@spootnik.org>


Hi,

The provided patch allows the VNC websocket server of a qemu process to
be provided over AF_UNIX as it is already possible for standard TCP VNC
servers.

Now that many clients support websocket connections, some exclusively,
it can be useful to expose the VNC server. One such case is when a
proxy is present on a host machine, allowing it to proxy to a
deterministic location withouth having to keep track of port mappings.

Removing the condition as is done in the provided patch creates a
functional server. If there's a downside to this approach I could not
figure it out while reading the code. My hunch was that the condition
was there for a reason, but it did not jump at me.

Cheers,
  - pyr

---
 ui/vnc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git ui/vnc.c ui/vnc.c
index 88f55cbf3c..b01a655400 100644
--- ui/vnc.c
+++ ui/vnc.c
@@ -3729,11 +3729,6 @@ static int vnc_display_get_address(const char
*addrstr,
         addr->type = SOCKET_ADDRESS_TYPE_UNIX;
         addr->u.q_unix.path = g_strdup(addrstr + 5);

-        if (websocket) {
-            error_setg(errp, "UNIX sockets not supported with websock");
-            goto cleanup;
-        }
-
         if (to) {
             error_setg(errp, "Port range not support with UNIX socket");
             goto cleanup;
-- 
2.38.1

--0000000000003cd72005ef0fa096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I forgot to publish the patch here<br><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded=
 message ---------<br>From: <b class=3D"gmail_sendername" dir=3D"auto">Pier=
re-Yves Ritschard</b> <span dir=3D"auto">&lt;<a href=3D"mailto:pyr@spootnik=
.org">pyr@spootnik.org</a>&gt;</span><br>Date: Fri, Dec 2, 2022 at 4:12 PM<=
br>Subject: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sock=
ets<br>To: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@re=
dhat.com</a>&gt;,  &lt;<a href=3D"mailto:qemu-devel@nongnu.org">qemu-devel@=
nongnu.org</a>&gt;<br>Cc: Pierre-Yves Ritschard &lt;<a href=3D"mailto:pyr@s=
pootnik.org">pyr@spootnik.org</a>&gt;<br></div><br><br>Hi,<br>
<br>
The provided patch allows the VNC websocket server of a qemu process to<br>
be provided over AF_UNIX as it is already possible for standard TCP VNC<br>
servers.<br>
<br>
Now that many clients support websocket connections, some exclusively,<br>
it can be useful to expose the VNC server. One such case is when a<br>
proxy is present on a host machine, allowing it to proxy to a<br>
deterministic location withouth having to keep track of port mappings.<br>
<br>
Removing the condition as is done in the provided patch creates a <br>
functional server. If there&#39;s a downside to this approach I could not<b=
r>
figure it out while reading the code. My hunch was that the condition<br>
was there for a reason, but it did not jump at me.<br>
<br>
Cheers,<br>
=C2=A0 - pyr<br>
<br>
---<br>
=C2=A0ui/vnc.c | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git ui/vnc.c ui/vnc.c<br>
index 88f55cbf3c..b01a655400 100644<br>
--- ui/vnc.c<br>
+++ ui/vnc.c<br>
@@ -3729,11 +3729,6 @@ static int vnc_display_get_address(const char *addrs=
tr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRESS_TYPE_UNI=
X;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.q_unix.path =3D g_strdup(addrs=
tr + 5);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (websocket) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;UNIX sock=
ets not supported with websock&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (to) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Port=
 range not support with UNIX socket&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto cleanup;<br>
-- <br>
2.38.1<br>
<br>
</div></div></div>

--0000000000003cd72005ef0fa096--

