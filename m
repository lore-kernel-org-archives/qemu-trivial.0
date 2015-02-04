Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJ0yM-0006Ug-8O
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 09:30:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YJ0yK-0006T7-7T
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 09:30:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YJ0yE-00026F-3V
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 09:30:28 -0500
Received: from mail-lb0-f182.google.com ([209.85.217.182]:38582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YJ0yD-00025x-TD
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 09:30:22 -0500
Received: by mail-lb0-f182.google.com with SMTP id l4so1738256lbv.13
	for <qemu-trivial@nongnu.org>; Wed, 04 Feb 2015 06:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QmVTK2xxURBEM+u0FyxPx6rnclgMP6bArmGSYHAMZtQ=;
	b=a130MMCm7TvPEazVdyG843CGJO1BanXj3c1weVYdEtSYqwXkMkAlW0J5zSWaBMl+M2
	N6j7lWAXYxLr2PQXjRxiDNucaqQ6veguixsJwtveFHAkuhI/UF4Jb0GxHcd92hxzd2mP
	fkqulFBNNUW3ffjV5UJmXLBxvHGD+EgA11l0Lf+RYhTKlxq8TVpD1pqW03IMI0MZrktv
	gVEVu+koq/v5OsQbqkeJ7dlMld7+XeewlD2PAFqSwgp4zBVXf6C6jPz7aNs1lzlChhsZ
	boTbduYjPti6E3j4P8Td+BCZ28PeChW0EXKO0NBm6uzEKP4ijXTSaAfXwov9T1EfMiI8
	wQSw==
X-Gm-Message-State: ALoCoQkrqbor1BHC8ZFIQJEkVdDXubUyGSQCTKMXYXLvq16rLDa66Z3fAwnmqUYQFG6jzeFl2J8X
X-Received: by 10.152.5.193 with SMTP id u1mr15640507lau.96.1423060221104;
	Wed, 04 Feb 2015 06:30:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.141.97 with HTTP; Wed, 4 Feb 2015 06:30:00 -0800 (PST)
In-Reply-To: <54D2204B.3010903@redhat.com>
References: <54CCA038.8000704@web.de> <54D2204B.3010903@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 Feb 2015 14:30:00 +0000
Message-ID: <CAFEAcA8G0TZwfZ82BuDYVc=FUjXMFDd2Fys1oJWbQ4tswGbnLg@mail.gmail.com>
To: Pedro Alves <palves@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Add GDB qAttached
	support
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
X-List-Received-Date: Wed, 04 Feb 2015 14:30:29 -0000

On 4 February 2015 at 13:36, Pedro Alves <palves@redhat.com> wrote:
>
> This looks like it'd mishandle a future qAttached2 packet.
>
> It should be doing something like:
>
>        if (strncmp(p, "Attached", 8) == 0 &&
>           (p[8] == '\0' || p[8] == ':')) {
>
> or:
>
>        if (strcmp(p, "Attached") == 0 || strncmp(p, "Attached:", 9) == 0) {
>
>
> Likewise other packets, if they have the same issue.
> (I'm not familiar with qemu's stub's internals.)

Looks like we get this wrong for a lot of our existing
query packet handling too... Maybe worth having a utility
function for "is this a foo query packet" rather than
raw strcmp/strncmp?

-- PMM

