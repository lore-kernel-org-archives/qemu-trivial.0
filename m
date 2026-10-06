Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60951CA6002
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Oct 2026 08:38:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xEN7L-000483-AO; Wed, 07 Oct 2026 04:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yundi.eric.xu@gmail.com>)
 id 1xEI3C-00010L-O1
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2026 23:10:42 -0400
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yundi.eric.xu@gmail.com>)
 id 1xEI33-0008Fl-4N
 for qemu-trivial@nongnu.org; Tue, 06 Oct 2026 23:10:31 -0400
Received: by mail-dy1-x1335.google.com with SMTP id
 5a478bee46e88-34c89609923so609815eec.1
 for <qemu-trivial@nongnu.org>; Tue, 06 Oct 2026 20:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791342448; x=1791947248; darn=nongnu.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=a7shD+Of3pCMm3lHwJzX3zAbeCuSad88ZRx98eK575I=;
 b=GJRKb6Ll9Qp0vRIqoOs6ihCNCIxO1p9L5HOrk8aFD551bpxc8M645XsZtj2rleKZTk
 C5Ns4JxWG1A25mjfITfrbAqT0YoXlTywFCtPb5FUKqze+4nS/GAEMeqZwmXI50HBcXYL
 HHxbzGGOc38O5j37QGzxQwByTsrkJUgz0zG3QtsX6ok2POmgCuLd1JKT7V+jb9iL9JVt
 ncj0w1IoJeHk3tDU6JLi78nfZZuII8JijPWOFsicACE969ZzJbnpDANEzbwYdilnZqac
 fDYYkkD0Pt/WIIgmYxjLiMpQ/ye8JwkyevRirXQqhF9fm1i4bqi1mxIH/I2WgWJyrkTL
 c0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791342448; x=1791947248;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=a7shD+Of3pCMm3lHwJzX3zAbeCuSad88ZRx98eK575I=;
 b=KQDMEx6/c+ms4JR3UrABz1GDeNtMaVQK1YhcUzoZCREGnNkvWAVsnLy86lV6SOqSFr
 ykO38bZi16+o34O9hhpzkuxpnXahMFuKEgQTHg9duTsBbgXQHQ1rI2qdNLYQ/TawylQ4
 KyTTfPsUUgjJq9RKtSWPITvJUvCWZQO038Hi4ChBjVkqlptIgNSxIzTPqZ+tr3goYy7G
 F+f87oXSMXgpDxefqMnqcflcDz34DlzKmH4Ml8kgSHRTQ3EE4meqi6fH82XEIdlXZ7Mq
 VweftCnpmm26OKwIPzGkOtEZGvqp5KT2qXXCMMYcpeeCp2SVH1kVnQZb2SGni9UMnAsX
 comA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSZtITBLNo8Z2BqsGQqJx3j19hjzD1Q91M4NbzLu6Pu1ICwHV3EFKZrt6SnhJ+YIwAxUrRL1rAzUT2WYs=@nongnu.org
X-Gm-Message-State: AFuF++l4T2/ovIaSLJe1WXF0OayqV1o4rYLvGuBdlvzi2kp6amiTtaOm
 18rBvvjjfR1oxa/TIvUo4EeQtw3loPbafngej4LDjIoe1Qikyh5MKSBnoxWhIjoS
X-Gm-Gg: AYBFou3o2H39I2DBM1VQLfZ5tJigU2smqC9uJXpVT7x1YXOu28k5lkzOO2MmZm2jb28
 Jt9RBKLZ/wQ3zOQVyyjvsEAozx4GO8m58CeChvbY4qxG71+Qdd05+LQ8wC9WXLnKrHRcVIud5tZ
 c/MLWWAp90RhzskJICV5CANpPwNw3oZkYnWfGSByj4zHnq3uato7qgev4eHsNoQ2a1Cyf3nCCrH
 2xE2TfEPfysFcjlS1vT/H5becvosWIqRjKRmxn7VtxaXfTlrpnt0X0f6g/BSTa3GzN8cVm8nV8Y
 iBTnvJ4xLoa5ZLI9Tvf6vBSqG1jNiQuw+qsKx9NVA866K9cwuJ7qlj6CkjH08cJkY3Xo8gxfGnc
 Dru0srmuLBnyX+rI7oNUHodyu0e9Y/bgAtgeIz6AEa4g0ijYx1zH1rvegriSzVF3+Jbdn5C61ml
 BzucBGo7kRaGllmKItAhHGQ7Y5QEDX+FRnTR5SIJtO6kr22GPjb9s0czTVBc7idnFB6lkfSgd+d
 s16J5w8I+tVhbA02O3Mw/Z2At9viCy89MD9dgqo8rWGAN1rNx6Yjq4524YFU7zFj/uvY1WRBwuy
 VdTQkknbv/PMFtqhtEJK
X-Received: by 2002:ad4:5c46:0:b0:919:5c8f:8fc0 with SMTP id
 6a1803df08f44-919978297b2mr3026456d6.37.1791320581770; 
 Tue, 06 Oct 2026 14:03:01 -0700 (PDT)
Received: from smtpclient.apple
 (host-183-232.ilcmi2.champaign.il.us.clients.pavlovmedia.net.
 [66.253.183.232]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91996bad504sm3355766d6.1.2026.10.06.14.02.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Oct 2026 14:03:01 -0700 (PDT)
From: Yundi Xu <yundi.eric.xu@gmail.com>
Message-Id: <FA33E2E2-28EB-4AA9-A069-9B70D292929B@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_569CBFC4-46BC-4270-A161-A6500595CE56"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH] hw/display/apple: Fix obsolete PGDevice function
Date: Tue, 6 Oct 2026 16:02:48 -0500
In-Reply-To: <CAFEAcA_pVpXW+8g1tTY0dyJdXXzffO7sn0gqMZMBsc+SgbPu4Q@mail.gmail.com>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>,
 qemu-trivial@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1e5b1f1f-1d7f-43cf-8883-0e0ab2ec88ce@gmail.com>
 <CAFEAcA_pVpXW+8g1tTY0dyJdXXzffO7sn0gqMZMBsc+SgbPu4Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1335;
 envelope-from=yundi.eric.xu@gmail.com; helo=mail-dy1-x1335.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org


--Apple-Mail=_569CBFC4-46BC-4270-A161-A6500595CE56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Thanks, I hadn't spotted that series. Please disregard this patch.

Yundi Xu

> On Oct 6, 2026, at 4:06=E2=80=AFAM, Peter Maydell =
<peter.maydell@linaro.org> wrote:
>=20
> On Mon, 5 Oct 2026 at 22:52, Yundi Xu <yundi.eric.xu@gmail.com> wrote:
>>=20
>> PGNewDeviceWithDescriptor is obsolete. Replace with
>> PGCreateDeviceWIthDescriptor.
>>=20
>> Signed-off-by: Yundi Xu<yundi.eric.xu@gmail.com>
>> ---
>>  hw/display/apple-gfx.m | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>=20
> There's a somewhat more comprehensive set of changes to this
> device that include something like this one already on the list:
>=20
> =
https://patchew.org/QEMU/20260916100021.73825-1-mohamed@unpredictable.fr/2=
0260916100021.73825-6-mohamed@unpredictable.fr/
>=20
> thanks
> -- PMM


--Apple-Mail=_569CBFC4-46BC-4270-A161-A6500595CE56
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><code style=3D"white-space: pre-wrap; =
color: rgb(20, 24, 31); background-image: none; background-position: 0% =
0%; background-size: auto; background-repeat: repeat; =
background-attachment: scroll; background-origin: padding-box; =
background-clip: border-box; font-family: var(--font-mono);">Thanks, I =
hadn't spotted that series. Please disregard this =
patch.</code><div><font color=3D"#14181f"><span style=3D"caret-color: =
rgb(20, 24, 31); white-space-collapse: =
preserve;"><br></span></font></div><div><span style=3D"caret-color: =
rgb(20, 24, 31); white-space-collapse: preserve; color: rgb(20, 24, =
31);">Yundi Xu</span></div><div><div><br><blockquote type=3D"cite"><div>On=
 Oct 6, 2026, at 4:06=E2=80=AFAM, Peter Maydell =
&lt;peter.maydell@linaro.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><div>On Mon, 5 Oct 2026 at =
22:52, Yundi Xu &lt;yundi.eric.xu@gmail.com&gt; wrote:<br><blockquote =
type=3D"cite"><br>PGNewDeviceWithDescriptor is obsolete. Replace =
with<br>PGCreateDeviceWIthDescriptor.<br><br>Signed-off-by: Yundi =
Xu&lt;yundi.eric.xu@gmail.com&gt;<br>---<br> =
&nbsp;hw/display/apple-gfx.m | 17 +++++++++++++++++<br> &nbsp;1 file =
changed, 17 insertions(+)<br></blockquote><br>There's a somewhat more =
comprehensive set of changes to this<br>device that include something =
like this one already on the =
list:<br><br>https://patchew.org/QEMU/20260916100021.73825-1-mohamed@unpre=
dictable.fr/20260916100021.73825-6-mohamed@unpredictable.fr/<br><br>thanks=
<br>-- PMM<br></div></div></blockquote></div><br></div></body></html>=

--Apple-Mail=_569CBFC4-46BC-4270-A161-A6500595CE56--

