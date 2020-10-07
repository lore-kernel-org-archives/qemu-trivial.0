Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQFSV-000240-Fi
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 15:50:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQFSU-00022d-3G
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 15:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQFSS-0002RP-EZ
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 15:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602100239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hMWUN8eM5TT9ZAjJVgh+G19Ce2yHvmCOHBacJkq/M5g=;
 b=TOAHPQ4D2fDp/Qha0FH4tPS0b8VRWqnk0h0FBGKliHwui0YQks9YEs+wcFIRRhHd9DNEXO
 7sAT5LY0IBrVZ57Tv4+j3UZAJ+xgs7gEytmJkSyvXropfB1WFVapVHdGsl2YAyTmxeFfjC
 MqpXuFGNg3HyEEzq92fEbKo2Af031FE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-OCNribscM6C1h3SUl79aUw-1; Wed, 07 Oct 2020 15:50:28 -0400
X-MC-Unique: OCNribscM6C1h3SUl79aUw-1
Received: by mail-ed1-f69.google.com with SMTP id ay19so1321834edb.23
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 12:50:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hMWUN8eM5TT9ZAjJVgh+G19Ce2yHvmCOHBacJkq/M5g=;
 b=TWS1ubhcK5O48AB3+1HsWse7RfVXto56VHpvX59dU+IJBkzYtaiAOdml6dER+LrsNV
 zZGKWabHjuMr825AMyCTYWzQ5BKaJHGZdOr2HrX4v+vQpHDkZNY5h7+pLw58c/mB4s8h
 etrxyLYnaSYAegJDdOOwYbp6ggTTjiVOZLKtWdF3qiCxvGJ1v4oWrh2tN3jiTtOmHl4w
 yi4mnZNBp80bbeXsUYmvhbvfZwEgtTa61DXMxjT8Br6Wmk0SwPvOSoC60iSszgnUYAyd
 xGJkDjfcgJUoosJrnkWTYompoSXc8b6+zzuZh6WFJXvPmMhQzeEkOR+JgwYavkQNhCnu
 bpdw==
X-Gm-Message-State: AOAM531DXhxyBPOtgJdkEWYjr4/Vlqyg4cCrCdHtwz9M2pgeP9pq+1PB
 rbopPAmAlvvm+a9l7OvYBXoDFVGZCjQHp74O7jpYnsbr2Njw2ZWt9d6IRZoHCji/eFXgSc7DTFs
 /upWO6WPxg83MnQsRSNIvBALsqwmu/uwS/w==
X-Received: by 2002:a05:6402:176c:: with SMTP id
 da12mr5438704edb.28.1602100227683; 
 Wed, 07 Oct 2020 12:50:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLG4y+vRqP0uFuJQaDF4FwKrbcWBF0PDAtobaYWi9nga2RmV+vMZgqMP6kanNtcuv/IgnReJbBBVGQwfTucBc=
X-Received: by 2002:a05:6402:176c:: with SMTP id
 da12mr5438685edb.28.1602100227502; 
 Wed, 07 Oct 2020 12:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201007162138.425-1-luoyonggang@gmail.com>
 <CAE2XoE9sf0p5QuG=dSqbOvmGvbzDaEBN8qSG1ejM=RH+D+zq1g@mail.gmail.com>
 <798fb17d-fcf5-3234-1e17-37b3c0a18b8e@redhat.com>
 <CAFEAcA8ivKMgGCjQSB1jmVjYDt4oMDfj+L1-coqVpEJnhEfwpQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8ivKMgGCjQSB1jmVjYDt4oMDfj+L1-coqVpEJnhEfwpQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 7 Oct 2020 21:50:15 +0200
Message-ID: <CABgObfYP+Dik6ZnWz3W60WbMbsvmSc5k8Th9+cxpRHe2iNRTBQ@mail.gmail.com>
Subject: Re: [PATCH v6] scripts: Convert qemu-version.sh to qemu-version.py
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>, qemu-level <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f48f2005b11a0677"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 07 Oct 2020 19:50:42 -0000

--000000000000f48f2005b11a0677
Content-Type: text/plain; charset="UTF-8"

Il mer 7 ott 2020, 21:18 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> > I have no idea how to fix it.  Probably it can be made to work using a
> > string argument and "shell=True", but at this point it makes more sense
> > to keep the shell script version.
>
> If you're keeping the shell script version could you queue
> the bugfix patch to it?
>

Yes, I did.

Thanks,

Paolo


>
> https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/
>
> thanks
> -- PMM
>
>

--000000000000f48f2005b11a0677
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 7 ott 2020, 21:18 Peter Maydell &lt;<a href=3D"=
mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritt=
o:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">&gt; I have no idea how to fix i=
t.=C2=A0 Probably it can be made to work using a<br>
&gt; string argument and &quot;shell=3DTrue&quot;, but at this point it mak=
es more sense<br>
&gt; to keep the shell script version.<br>
<br>
If you&#39;re keeping the shell script version could you queue<br>
the bugfix patch to it?<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Yes, I did.</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=
</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
<a href=3D"https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lurea=
u@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patc=
hew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/</a><br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--000000000000f48f2005b11a0677--


