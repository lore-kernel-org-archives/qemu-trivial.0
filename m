Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcG2d-0004Ii-EA
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 10:17:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcG2W-00047j-JO
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 10:17:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcG2R-00046v-VR
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 10:17:16 -0400
Received: from mail-da0-x22f.google.com ([2607:f8b0:400e:c00::22f]:37881)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UcG2R-00046k-PI
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 10:17:11 -0400
Received: by mail-da0-f47.google.com with SMTP id k13so339477dae.20
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2013 07:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=gDq2grxlaVZwIhD4o3TMs0L5/SQOLmxFg18kFDrH2R8=;
	b=iFN+IZgvmG0pvCt46/shNKE2QoUgNDGD+LOX+tG5KG/7glhfZJSS/DZpEpUxGwRVng
	aJ3vX4tbXNA10nVWZ55jkCrE0gZpEvo0jE7ay/vMEqG3MXtcRTtgMVGcejMIu3Y+iDD9
	H3Omue3kurVbRKnA5szgtQhSFFPArfj95WrbThzjyzEDH0j8bjJ3JhKUex8jnSJCI0t0
	EhEXkncJxQNwNnLjVrXkxs0HK/1qTcCW39Y3n6HhI1AvntWVUFwTipoLZmoZfY719uxS
	/6RLgWDlSzMl1vjuS9J4WLtEiL9qOqjbB8XwQTRsiBUcGknZZTbbhkM9bZw1AFOjAMjg
	Ym7A==
X-Received: by 10.68.112.1 with SMTP id im1mr34326998pbb.116.1368541030823;
	Tue, 14 May 2013 07:17:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.70.46.66 with HTTP; Tue, 14 May 2013 07:16:49 -0700 (PDT)
In-Reply-To: <519246F4.4040803@msgid.tls.msk.ru>
References: <1368530312-16080-1-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA_P78TYqZGr0reev4Oa=4j1qoKaGbC6rEnBDeMtUo-TTg@mail.gmail.com>
	<519246F4.4040803@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 May 2013 15:16:49 +0100
Message-ID: <CAFEAcA-_eyVSdD+L_ejNYQjaiKndgPU4RJOVQFJULBvGZV9qTg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlBgeYeV3Aa52s7CmMV9RGCODedeo/Tj5fgOg/9S/R9Bv7rd4K3nbGNWFRSSdxjwLHCyi65
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c00::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (trivial)] remove some
	double-includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 14:17:21 -0000

On 14 May 2013 15:15, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 14.05.2013 15:30, Peter Maydell wrote:
>>
>> There's already been a patch on the list for this one:
>> http://patchwork.ozlabs.org/patch/240540/
>>
> Yes I know Peter, and actually this is the patch which prompte
> me to look for other places.  The person in question does not
> reply (so far)

Is there anything they need to reply to? The patch is good,
it has a signed-off-by and a review, you can just put it in
the trivial queue to be applied next time you do a pull
request for it.

thanks
-- PMM

