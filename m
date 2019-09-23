Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCMtE-0000Yn-UI
	for mharc-qemu-trivial@gnu.org; Mon, 23 Sep 2019 07:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iCMtC-0000Wl-MC
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 07:52:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iCMtB-00018g-Kk
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 07:52:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37302)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iCMtB-00017g-DT
 for qemu-trivial@nongnu.org; Mon, 23 Sep 2019 07:52:21 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9482DC049D7C
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 11:52:20 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id v13so4696889wrq.23
 for <qemu-trivial@nongnu.org>; Mon, 23 Sep 2019 04:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sSRUGmpkqjCBncYBiL2Nf0gUwX95C0t8AFl/cfVvkgc=;
 b=REcEFBHihFw+iKhhGeDoP7bNNDgsSVoaE5iA1mw51CSJ7jooq58A739tg5BdW/1fyM
 f+wvqcU982vec32GjcracTTYKVPb9bA4Rdalf1MCFynI98oRFohcnje4kn4gtUAHVelp
 Dq8+ZPPZcTAJaCF/SBvsFMSLunpfpYh74Y53eGZDxMOAqoTE+KIRp52zPkUNjcz943YD
 RbfXxTmBfmY9V1oDurL/to7/vnHBwkYk0ZO3Bx/p6qZWA6CggeyriBnOWcxdI1EhjEEq
 92s0Q7V0yaXfXhbOGPS553hEbh4uo5byD8lPDpfRgPmHbsC41bv60LQfw8pS2XVGWbuh
 /9cA==
X-Gm-Message-State: APjAAAWhjm6vf7k+BunWYaMRe/C7vUN8kMHHexiNPZmav5Zn9du6StoL
 nLoamPVViv0Vh5hLfgJizxxca5AiQLDIY2gWPfw6TE7bvQwLTnRdEJsCA57QJfZMIlMgWDPQUqz
 6A6XPIbai03x2+zXwtA==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr21258214wrq.292.1569239538889; 
 Mon, 23 Sep 2019 04:52:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9URtIpl/Xb7uAwk1Pp2XHBPPCvdkeV0d48XhCw7VjILVie61W4q4nQ8/gFlaV0Zc3TWE66Q==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr21258202wrq.292.1569239538623; 
 Mon, 23 Sep 2019 04:52:18 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9520:22e6:6416:5c36?
 ([2001:b07:6468:f312:9520:22e6:6416:5c36])
 by smtp.gmail.com with ESMTPSA id c6sm11827477wrb.60.2019.09.23.04.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 04:52:17 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] Replace '-machine accel=xyz' with '-accel
 xyz'
To: Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20190904052739.22123-1-thuth@redhat.com>
 <5e8d67e5-842f-7cea-28a5-f07050615c38@redhat.com>
 <87wodzp7vm.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b27bedba-3046-2350-1f7b-7845277be66e@redhat.com>
Date: Mon, 23 Sep 2019 13:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87wodzp7vm.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Mon, 23 Sep 2019 11:52:24 -0000

On 23/09/19 13:30, Markus Armbruster wrote:
> -accel is yet another convenience option.  We have so many of them.  I
> dislike the complexity they add to the CLI.  Here's how this one got in=
:
>=20
> commit 8d4e9146b3568022ea5730d92841345d41275d66
> Author: KONRAD Frederic <fred.konrad@greensocs.com>
> Date:   Thu Feb 23 18:29:08 2017 +0000
>=20
>     tcg: add options for enabling MTTCG
>    =20
>     We know there will be cases where MTTCG won't work until additional=
 work
>     is done in the front/back ends to support. It will however be usefu=
l to
>     be able to turn it on.
>    =20
>     As a result MTTCG will default to off unless the combination is
>     supported. However the user can turn it on for the sake of testing.
>    =20
>     Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
>     [AJB: move to -accel tcg,thread=3Dmulti|single, defaults]
>     Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>     Reviewed-by: Richard Henderson <rth@twiddle.net>
>=20
> Not a peep on why the existing options are so insufficient we must have
> another one.
>=20
> Our CLI will remain the steaming mess it has become until we reform the
> habits that got us there.

-accel's accel suboption is currently defined as a convenience option,
but it shouldn't be.  It's the older "-M accel=3Dfoo:bar" that should
become "-accel foo -accel bar" and -accel then is the preferred way.

The existing option "-M accel" was insufficient because it didn't allow
accelerator-specific suboptions; they were all over the place ("-machine
kernel_irqchip", "-tb-size", etc.) and indeed mostly in wrong places.

Paolo

