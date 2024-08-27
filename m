Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1siyEl-0001F9-7n
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 11:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1siyEk-0001Ao-1k
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1siyEi-0003V5-4T
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:36:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724772959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hXBj1zpRbkovYQZaFT0xfH4IPmRYfCibUwJ+bcQKbJQ=;
 b=K+Ywn9Ckp5iAgfJi8pbVYeVgJ3fIg0h1rPu0uzN7pQq8xJNdbhoQE+vSNvyFEQ96LJgokI
 cSHwocyHCmXGrKsDH/s9SQFBqhx5+61iWTaU4JVzo8tMqIPHm3qGyVSiH8ibulJTHBLLLv
 Lekc/iEugZCmZjFnHjOsOKTvw6bg2pg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-l7HJ6ikWPMWH-Y769FMvtw-1; Tue, 27 Aug 2024 11:35:55 -0400
X-MC-Unique: l7HJ6ikWPMWH-Y769FMvtw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a7d2d414949so518913166b.0
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 08:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724772955; x=1725377755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXBj1zpRbkovYQZaFT0xfH4IPmRYfCibUwJ+bcQKbJQ=;
 b=QaV2NPr7R0tVrLxzlMel4hmVYk0A4PMk5O2UqB39MOVgBjmaoREtQWG2b/QII8hoVW
 HdcjOenmS/hioTW1MLmWHZ+rfQfa6bCz4A0z9Wp1K/p5P5fH/i0PEM7DmpfQ6VlLG4g7
 NH7L1YpP5I92mH2t7wJj1QvFzFkXC2AiaavWOi8nQtfGTX5Mf+YdUca0KPaFpdcwVZ5s
 b6EKoSvt279oyH1xQhqbQfI+HscOS8LgX5lNSr+NcXRDeNzu5gFi3RPwygyFSjv3ukqS
 0i8pXgvRmnwqKG3BzKSpe8gbqY6Y1CJX503/Hsi9YSzmb+f4P7oV9Dwj71klzgz6Fp2R
 93Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3kbEH8Qo4hMKBotpvVfbuBP5kinno1kx1ynXnxvCOczbUme3o6VSIpmehn4Nn3KeucN2PMAnaw5r9GKI=@nongnu.org
X-Gm-Message-State: AOJu0YyhcxvQ1y+O3FLIVkhj239yiqmbSHV8tSH8wCZBG10goM3p+6jR
 WYee1QTUVcgv79SMRvh5o/5FzIScy3lHDSICpgZI8VGO0KcbpZeu0TTaGnbybOZfNv5P5ZfjGol
 A36qJmfaDytpDxLufOcowFF/qvs85PCisCg6LK9Mp6wB1P2+jNOYLzXlSRJ06/Hw2Fv2ZFp8Lhs
 wh+Z4D6Vsj0TMqhTocZgkrwfVpSdnOlg==
X-Received: by 2002:a17:907:9487:b0:a86:bb5f:ebbd with SMTP id
 a640c23a62f3a-a86e3d40516mr243557566b.63.1724772954605; 
 Tue, 27 Aug 2024 08:35:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFVrH03ygMqYp0dtnyox9CSJB2OqtA2jRh0d50Y7xj5QsIaKIk2zUL1n5zS5DbboAYfA7UIkUmhe+ailZoa1U=
X-Received: by 2002:a17:907:9487:b0:a86:bb5f:ebbd with SMTP id
 a640c23a62f3a-a86e3d40516mr243555366b.63.1724772954141; Tue, 27 Aug 2024
 08:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240827151022.37992-1-anisinha@redhat.com>
 <20240827151022.37992-3-anisinha@redhat.com>
 <CAFEAcA9Xq7S6_-hYkNYdv6-z7tM7xSgDGyC92L19kTm02qScAw@mail.gmail.com>
In-Reply-To: <CAFEAcA9Xq7S6_-hYkNYdv6-z7tM7xSgDGyC92L19kTm02qScAw@mail.gmail.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Tue, 27 Aug 2024 21:05:41 +0530
Message-ID: <CAK3XEhPPWvRuzc=DZiP0ni-c9-KsT6=R+9_XAM5224KsiARh=g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] kvm: refactor core virtual machine creation into
 its own function
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 cfontana@suse.de, 
 Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
 kvm@vger.kernel.org, qemu-devel <qemu-devel@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000401a3c0620abff37"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 27 Aug 2024 15:36:02 -0000

--000000000000401a3c0620abff37
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug, 2024, 8:59 pm Peter Maydell, <peter.maydell@linaro.org>
wrote:

> On Tue, 27 Aug 2024 at 16:11, Ani Sinha <anisinha@redhat.com> wrote:
> >
> > Refactoring the core logic around KVM_CREATE_VM into its own separate
> function
> > so that it can be called from other functions in subsequent patches.
> There is
> > no functional change in this patch.
>
> What subsequent patches? This is patch 2 of 2...
>

I intend to post them later as a part of a larger patch series when my
changes have stabilized.



>

--000000000000401a3c0620abff37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 27 Aug, 2024, 8:59 pm Peter Maydell, &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Tue, 27 Aug 2024 at 16:11, A=
ni Sinha &lt;<a href=3D"mailto:anisinha@redhat.com" target=3D"_blank" rel=
=3D"noreferrer">anisinha@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Refactoring the core logic around KVM_CREATE_VM into its own separate =
function<br>
&gt; so that it can be called from other functions in subsequent patches. T=
here is<br>
&gt; no functional change in this patch.<br>
<br>
What subsequent patches? This is patch 2 of 2...<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I intend to post them later=
 as a part of a larger patch series when my changes have stabilized.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
</blockquote></div></div></div>

--000000000000401a3c0620abff37--


