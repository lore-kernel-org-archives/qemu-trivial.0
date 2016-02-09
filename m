Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aT9Rn-0001ES-Bi
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 09:39:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Rl-0001EB-Lz
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:39:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Rk-0007eU-Tc
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:39:17 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:35537)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Rk-0007eH-Pf
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:39:16 -0500
Received: by mail-vk0-x235.google.com with SMTP id e6so117872784vkh.2
	for <qemu-trivial@nongnu.org>; Tue, 09 Feb 2016 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=voO4fjgrP2VeugRmxzqBbPvKL7PmNeWZ+r2/dTMz0TA=;
	b=aHi9mTSR0Pmu4RPjh3cJJ3sy4s/Ob1DJ0khgfzRiq7T9EXUcU8JKGpTeETu8g91lDj
	g3GGkUXICrXHSdyw1XTNiFW3Cq1OHcCf+Bzrjmi9rTC4XHDbes3lVz54PGugBA+Uhgh9
	BkG+npjRixDwDAqiyJyLPeaj0Emz/GsDVj4qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=voO4fjgrP2VeugRmxzqBbPvKL7PmNeWZ+r2/dTMz0TA=;
	b=UeS3cj9YGbP5IXqwKJK4HSdrvhjC4IZ+2+FM/FswVj18KMMtSIks70qy7IxTq9wtHa
	m+CDzjuW/vd6AAXYNUlaRigJahVhmTSwroutNilqlnTQko5KPYCTwWAX19gpZ6uiSsfs
	7lrKOUxRiqb2ootJ6Edgsi0+SOOLrkLh8C0gACorXEThQafJnrTE4Fi5n/LBlg58ACxF
	q3aCnnaAnT9aC5C9cWWoDWIqQUmAXpAZoHyNhskxff5cQNv/L7pFBKgU7woNPn+BYmT6
	h1UW7aVn0hn5gp1P1utgZkZAmVtd3TNsrShb+lfT0pgU+OsSmA2TKyLsuw9Febd4+286
	fZTw==
X-Gm-Message-State: AG10YOScNbAFnyHug6mg/es2TP3vqlRoA1vScwk3Bn9tu1cgqVM5wnZKVl8PxOd/sZzLYq7q3pILVGWUFMXUM1Ny
X-Received: by 10.31.141.2 with SMTP id p2mr25877853vkd.37.1455028756128; Tue,
	09 Feb 2016 06:39:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 9 Feb 2016 06:38:56 -0800 (PST)
In-Reply-To: <56B9F9B8.4000403@redhat.com>
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
	<20160209142120.GM24614@redhat.com>
	<CAFEAcA8QG_WagW_5GzuBkyLnuL3v2XX9KkEdiTicLYnWW4UroA@mail.gmail.com>
	<56B9F9B8.4000403@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2016 14:38:56 +0000
Message-ID: <CAFEAcA8f5nXPVAqRJmKR9JQoxDBrsUvgedK7L8ka2PP+ppH0_g@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] w32: include winsock2.h before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 14:39:18 -0000

On 9 February 2016 at 14:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 09/02/2016 15:28, Peter Maydell wrote:
>> On 9 February 2016 at 14:21, Daniel P. Berrange <berrange@redhat.com> wrote:
>>> > On Tue, Feb 09, 2016 at 03:16:57PM +0100, Paolo Bonzini wrote:
>>> > include/qemu/sockets.h also has windows.h included before winsock2.h
>>> >
>>> > Presumably it didn't cause a failure for you because everything using
>>> > sockets.h already pulls in osdep.h. A reason to prune sockets.h
>>> > headers perhaps.
>> More generally we could prune anything including windows.h manually
>> (there are a dozen or so .c and .h files doing that currently).
>
> I honestly do not have time to work on this. :(

That's OK, I currently have a bunch of include file cleanups
going through so one more won't hurt too much :-)

-- PMM

