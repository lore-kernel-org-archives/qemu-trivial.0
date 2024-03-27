Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rpa4H-0008HI-Ji
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2024 16:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rpa4G-0008Gy-1U
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 16:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1rpa4E-0004Lf-DN
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 16:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711572012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=krUHF2DrfUxOrhuT3iJBmQP1zr5vBXVBIFziYMSw8/Y=;
 b=Bwosz7OfJWAvwUXPbPGCBnKE+PoIVB9HLoN5+cpeAbDfZ7EqWgZePO5a2V1jMNeOz8E4d9
 UUrq1EEl60/S3fBje+JcuYmPy9WchlNi1JENXJBL7iF+ur8/havfh9mRH6eUG/d1wrXlQh
 Oy6/Zolj82V08cXhsBAeS/8EKo1EmQo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-o8ooh2b4ORW_-vV2fIJL_A-1; Wed, 27 Mar 2024 16:40:10 -0400
X-MC-Unique: o8ooh2b4ORW_-vV2fIJL_A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33ec6c43a9cso126240f8f.1
 for <qemu-trivial@nongnu.org>; Wed, 27 Mar 2024 13:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711572009; x=1712176809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=krUHF2DrfUxOrhuT3iJBmQP1zr5vBXVBIFziYMSw8/Y=;
 b=LFUxt+2h5RlcIXoeLiWRmjSgyOYR5Wvv4bhp52Q+xfcxj4cpVRiAx+2M0lA2/1YOYa
 76Y/ppGxfCMVEMdYR5f3Il6BL6DT7C8bnPXw0m2epYHI0HFfq8kfd7GWnYU7TmTPfPjL
 OpW6WBTCr1eEd3CPDYcNs/Pu94h+8xLicChZj9Kfw/IINQ1SJbvJXvsvz96oIYPNLUNv
 KR+w6QVWT2A/rVG86JxTsKo/7GEoPO9ppoGJ2jlx9svR2U806nXdopaLyQZhPT3L3+Dn
 ZqugkNKGGkb4Ey3KxppBI2cMqEVYR2XYbpx+OASlIMnrizO2iU9lgFb98XiURUl2ml57
 U4Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyrThV8RmfI+JrobBl4UC4rcF3QKxsDI4ynsePBk7nkPrXIkwQQ3PNP6RKU0lFp++GyU9/yjTNfJoG7xmtycXxuQOX3u8zxg==
X-Gm-Message-State: AOJu0Yy7KG2Erq11XEBPtjm/KkjA2w8hPsR4Hi/rKIeYEoYasxLB/95q
 qNbKOXdCK93XF4zBJHOSzSoxqFUn6kjI5h9rFfeIer88XKycureKPzeT0UfJfHyJpEALxBsBjBn
 r7d6Mh0ARRg9vo1o8rHG69bweus1jBQ4PAZsfGvbU1aSHsc8Eb4pXHGHkir+QIyeUM6rq49IzHC
 3kHLYnYMfiucTeB3yZFd9/9HRuypcwfQ==
X-Received: by 2002:adf:cd06:0:b0:33e:773c:ff6 with SMTP id
 w6-20020adfcd06000000b0033e773c0ff6mr989966wrm.46.1711572009488; 
 Wed, 27 Mar 2024 13:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXkarStpofujde81FvxJvvHh+jyq9+yHq+cqPK/Qo/S8PI4PIuDajYeke/tgx2pVp6Za9uL9zqDxkHwnEpRGE=
X-Received: by 2002:adf:cd06:0:b0:33e:773c:ff6 with SMTP id
 w6-20020adfcd06000000b0033e773c0ff6mr989948wrm.46.1711572009139; Wed, 27 Mar
 2024 13:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
 <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
 <20240326171632.3cc7533d@imammedo.users.ipa.redhat.com>
 <ZgP5x3ECYGevla1-@redhat.com>
 <20240327140917.69d86539@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240327140917.69d86539@imammedo.users.ipa.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 27 Mar 2024 21:39:57 +0100
Message-ID: <CABgObfbozdB=8ARjvGdkJ3yhMuHmZC6Ro47BYZA4YE2rFzyhRA@mail.gmail.com>
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
To: Igor Mammedov <imammedo@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Bernhard Beschow <shentey@gmail.com>, devel@lists.libvirt.org, 
 Richard Henderson <richard.henderson@linaro.org>, "S. Tsirkin,
 Michael" <mst@redhat.com>, qemu-trivial <qemu-trivial@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009ce0220614aa69d5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 27 Mar 2024 20:40:16 -0000

--0000000000009ce0220614aa69d5
Content-Type: text/plain; charset="UTF-8"

Il mer 27 mar 2024, 14:09 Igor Mammedov <imammedo@redhat.com> ha scritto:

> It's question of whether we are willing to do unthinkable,
> i.e. to break QEMU <-> guest ABI for isapc case by removing
> corresponding fwcfg entries.
>

It's not unthinkable since it's unversioned.

we are loosing a chance to cleanup
> QEMU code base touching following
>
>     m->option_rom_has_mr = true;
>     m->rom_file_has_mr = false;
>     pcmc->pci_enabled = false;
>     pcmc->has_acpi_build = false;
>     pcmc->smbios_defaults = false;
>     pcmc->gigabyte_align = false;
> pcmc->smbios_legacy_mode = true;                  pcmc->has_reserved_memory
> = false;
>

Some of these can go away, for the others probably we can think of making
isapc a direct subclass of X86MachineState.

I would rather keep it because it's the only way to test userspace
interrupt injection in KVM.

Paolo

they are all marginal but in shared code, and removing them
> makes code a bit more easier to follow (especially when it
> comes to memory layout).
>
> > With regards,
> > Daniel
>
>

--0000000000009ce0220614aa69d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 27 mar 2024, 14:09 Igor Mammedov &lt;<a href=3D=
"mailto:imammedo@redhat.com">imammedo@redhat.com</a>&gt; ha scritto:</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
It&#39;s question of whether we are willing to do unthinkable,<br>
i.e. to break QEMU &lt;-&gt; guest ABI for isapc case by removing<br>
corresponding fwcfg entries.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">It&#39;s not unthinkable since it&#39;s unversi=
oned.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">we are loosing a chance to cleanup<=
br>
QEMU code base touching following <br>
<br>
=C2=A0 =C2=A0 m-&gt;option_rom_has_mr =3D true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
=C2=A0 =C2=A0 m-&gt;rom_file_has_mr =3D false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
=C2=A0 =C2=A0 pcmc-&gt;pci_enabled =3D false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=
<br>
=C2=A0 =C2=A0 pcmc-&gt;has_acpi_build =3D false;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
=C2=A0 =C2=A0 pcmc-&gt;smbios_defaults =3D false;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<br>
=C2=A0 =C2=A0 pcmc-&gt;gigabyte_align =3D false;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pcmc=
-&gt;smbios_legacy_mode =3D true;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 =C2=A0pcmc-&gt;has_reserved_memory =3D false;<br></bloc=
kquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Some of th=
ese can go away, for the others probably we can think of making isapc a dir=
ect subclass of X86MachineState.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I would rather keep it because it&#39;s the only way to test user=
space interrupt injection in KVM.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">they are all marginal but=
 in shared code, and removing them<br>
makes code a bit more easier to follow (especially when it<br>
comes to memory layout).<br>
<br>
&gt; With regards,<br>
&gt; Daniel<br>
<br>
</blockquote></div></div></div>

--0000000000009ce0220614aa69d5--


