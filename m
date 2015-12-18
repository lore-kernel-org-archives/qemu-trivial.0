Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9ufB-0001ru-J7
	for mharc-qemu-trivial@gnu.org; Fri, 18 Dec 2015 08:01:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9uf3-0001iH-KI
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:01:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9uf2-0008VG-P3
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:01:29 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:33747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9uf1-0008Uq-J0
	for qemu-trivial@nongnu.org; Fri, 18 Dec 2015 08:01:28 -0500
Received: by mail-vk0-x229.google.com with SMTP id a188so65528933vkc.0
	for <qemu-trivial@nongnu.org>; Fri, 18 Dec 2015 05:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W6BwnHDZHt2gA1gZAcenFRy9i6TCf7H4vxYgCO4p794=;
	b=etk7gqNYMlRHLfIzLqniKJPsUyXLJoes72SqvWcZl8JI/VIUnyXMnJziFhDt4wOOqH
	fvvlYTYnc9lzIJLVq4PqbwHEkWHcEsBsC2M8uykG/iOH6Pj6f8hiswTT9+3QgSdVuBJU
	msfS0gz4cu1VGTntrPkjbOITk2N7CKjZN6zw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=W6BwnHDZHt2gA1gZAcenFRy9i6TCf7H4vxYgCO4p794=;
	b=VV4bW4ubsHTfWgj5IWp9BbeBJBkLO4FyWqC5oRm+Cd1jltTTeelTZXiuskCWoSaIbJ
	6Nl5447wkIRYy1IbfQMfsmj2NTSltw3xNbum/C5WdhrTXfxwvgEVCeR+exAVO/+CDre1
	GHVODHiAha8LHPQX4mPQZDof10mwDymYtk/cvI58hP7Yp0vptKMRoUViY+ZwFzvJEAX8
	XKUSaiVZ9MeiRma+Oco4ZA5gS9A6ArWqwb96yfagWrHDXO1TijI7lIfMaAvK+9eiN1Lf
	I01v8Pcg/NvvUCrPrP+Cvxs4gXjJ/99x295qs1XTbtfiHSbPBVGliT1U8zrHNJL0GEK8
	L3FA==
X-Gm-Message-State: ALoCoQlwXbaqC6In9GxYJcvbU63cKln9DMPgVPb/H1sx/YVufRe0CAlFrJ3Z7r6rJM1y39iDtQlfGBwXNHt1GwpUBDPEr+aZ4JZacV4KCHJBHh/40cp4Pvw=
X-Received: by 10.31.52.211 with SMTP id b202mr2066655vka.82.1450443687101;
	Fri, 18 Dec 2015 05:01:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 05:01:07 -0800 (PST)
In-Reply-To: <87wpsbex5u.fsf@blackfin.pond.sub.org>
References: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87wpsbex5u.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 13:01:07 +0000
Message-ID: <CAFEAcA8VxYbYYWHcevhOVndWnTegAWvKMnmd-HR+-p04ws8bGw@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Cao jin <caoj.fnst@cn.fujitsu.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Use macro instead of
	plain text
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
X-List-Received-Date: Fri, 18 Dec 2015 13:01:34 -0000

On 18 December 2015 at 12:52, Markus Armbruster <armbru@redhat.com> wrote:
> Cao jin <caoj.fnst@cn.fujitsu.com> writes:
>
>> There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems it
>> is missed.

> I suspect there are more instances of the same problem.

> Not sure how interested we are in consistent use of these macros...

In a lot of cases we'd need to find somewhere appropriate to put the
TYPE_* macro which might well mean creating a new header file just
for the purpose. That seems like overkill...

thanks
-- PMM

