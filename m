Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dO6ab-0000IU-H7
	for mharc-qemu-trivial@gnu.org; Thu, 22 Jun 2017 14:12:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO6aY-0000Fm-LT
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 14:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dO6aX-0002J0-Pl
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 14:12:18 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:35109)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dO6aX-0002It-Ho
	for qemu-trivial@nongnu.org; Thu, 22 Jun 2017 14:12:17 -0400
Received: by mail-wr0-x22c.google.com with SMTP id k67so33851847wrc.2
	for <qemu-trivial@nongnu.org>; Thu, 22 Jun 2017 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WWRsFohzI05iK/kYTvWqINBJrLn4Uid1XYnfPuraUQo=;
	b=S8/EeJdimEHc3OfltrZsxNdl+XpMRoFAUl1LYTLr3YFy9/5THuMrMMsfdnDQNZzTCI
	+2mmMCPpKukP1rx786yZWwf4Jv2ri3PbZiQQHIWgHPSAJ5T5COicOQSgH9if0Wbsr9AF
	wc5DGIKUsX0zmANsC2J1XXgJ39pknZ9GJzB4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WWRsFohzI05iK/kYTvWqINBJrLn4Uid1XYnfPuraUQo=;
	b=Nm02xrlWW49Z0csKYKkUOTt37BM+IQ6G8RloFHH7fP/wKJAQucoCE8RujsRnsioHKH
	Lmq0WStbbRxjvISrMQi9bivz8x8B1F22KIv4TR69kfcXUVaKHMGZ1gC3Ri1rP3dqgj3V
	msLuAxT5e7gZEFG2uMq3Ru39Ywrl9Zccv3A0Ii8e+3bWdj32fThpwmZmhKvXgIXYyaWD
	kmvlsZuJJ2AGbOHOZLgkA5qUPbasHsAvS0yQbaFusMLnwKOGV66WxkXZYAaOIHnJORlM
	Nq9lmIGNq6JwchqwPRi1P8HardcovrmJZ6DjNRBzCnABerE47EPoilbJKayYceIFFYZO
	I61Q==
X-Gm-Message-State: AKS2vOy7RbJCgML/0aEb+AG7p37aBt/AMTPAMxjkUOXZ/vlZCfK0DIb+
	59sEQNfWQ2DaDWiMOV1bDS+enqUED7U9
X-Received: by 10.28.66.23 with SMTP id p23mr1658426wma.38.1498155136442; Thu,
	22 Jun 2017 11:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Thu, 22 Jun 2017 11:11:55 -0700 (PDT)
In-Reply-To: <fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
References: <149814756006.27338.8723356702388175951.stgit@bahia>
	<CAFEAcA8yqb8ykP8nCnoVNQUZd851RhOLFf2TfkHZmL2je+pP=Q@mail.gmail.com>
	<20170622184255.2d44e3bd@bahia.lab.toulouse-stg.fr.ibm.com>
	<87injo6jla.fsf@secure.mitica>
	<CAFEAcA-g-=AkH3t8jOTFY_9zA6ECS57-3MS=cHPb+Q6sePzNsw@mail.gmail.com>
	<20170622172555.GE2100@work-vm>
	<20170622194649.6d251753@bahia.lab.toulouse-stg.fr.ibm.com>
	<20170622175012.GF2100@work-vm>
	<fb2c7124-2d3f-6684-e2f2-265bfb3eb6da@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Jun 2017 19:11:55 +0100
Message-ID: <CAFEAcA-A=UrkKjLmVOcFA_d4rMW1AJwGffE4r2Uy6fw++XFF6w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Separate function types
 from opaque types in include/qemu/typedefs.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Jun 2017 18:12:19 -0000

On 22 June 2017 at 19:08, Thomas Huth <thuth@redhat.com> wrote:
> On 22.06.2017 19:50, Dr. David Alan Gilbert wrote:
>> Could do; I'm just not finding tiny header files with one or
>> two entries each that useful.

Well, it means that the bulk of code that doesn't care about the
types doesn't get its compilation fractionally slowed by having
to parse the typedef anyway. In general I think we're drifting
towards "have each .c file get fewer things automatically" rather
than otherwise (eg more finely focused files rather than stuffing
everything into qemu-common.h).

> Do we really need these function typedefs at all? IMHO it's quite ugly
> to hide such things in a typedef unless it is really necessary (and in
> this case, it does not seem to be really necessary since it is only used
> in a few places). So what about simply removing the typedefs in this case?

I find function typedefs much more readable than having the
function-types inline in function arguments and the like.

This is all fairly rapidly heading into bikeshed territory
though -- in the final analysis I don't think it matters
much what we do.

thanks
-- PMM

