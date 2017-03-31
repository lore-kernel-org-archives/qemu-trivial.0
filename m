Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cu0gG-0003oX-Rm
	for mharc-qemu-trivial@gnu.org; Fri, 31 Mar 2017 13:49:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1cu0gF-0003nb-6p
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 13:49:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1cu0gE-0003qK-GS
	for qemu-trivial@nongnu.org; Fri, 31 Mar 2017 13:49:47 -0400
Received: from mail-io0-x22a.google.com ([2607:f8b0:4001:c06::22a]:35883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <carpeddiem@gmail.com>)
	id 1cu0gC-0003oR-HK; Fri, 31 Mar 2017 13:49:44 -0400
Received: by mail-io0-x22a.google.com with SMTP id l7so44189048ioe.3;
	Fri, 31 Mar 2017 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=5enSD0hSrOy8hg5a3QDxKEvD3+wAA/YrZMa6Swdhw8w=;
	b=ml7fF2mp3fJRdAxKIxV6GcT707f1vUj5b/IWQnPBBzS4SDfbbnsqL1UGhxxmoW159u
	x50iXr1vavuYEyMO2W5H9hMNkTtP8lB9DIHroQ7MSp4gQqwh00W5rfIRpgD23Eb0msK6
	iyoLZ5SqGgojTdDdw6lVkfaV54RdX8lGs4xLUiWZu2kiM8WYpcir5fRITrNOZ4f9iQsJ
	4x8MVFGbUI419TIGBv8l4ujflolOvVbyVdjvj1MKYQM23R1sVkvG/vXVewRK+QYjnLrV
	W5dNSQUQsXO4K54spAOhny1OvI7pHA/twpsCboqdaWRPIst3JYV5oKYqXD2kRSLGIlqm
	Jjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=5enSD0hSrOy8hg5a3QDxKEvD3+wAA/YrZMa6Swdhw8w=;
	b=GYNS0Y36CVGvpzdKfEI7gl1LYgb6GA3pgI4G6EGJUU7DyDCVwSyearvKePOTXZurBi
	7ZQhM13QD5QiRVYbZouZ355tIVDr642tSuQogJRFiXlwqAEL0pM85dg6/XIkZLWRFdMd
	aHGuKN5gv+/Z8IPexm6QEVXOSLalx5H9n+OAtiU8d4VI0j3wCoe451YYqZCiWl3Zmyt2
	4TV1PeLTuvb7cHYZehttax6awva4M+sw6/jNJbpJErVRySMWbVfG9KTBrjWQ06261mkb
	lsHsXKzJYhy58El8OjEDUa8FhximHCourk3J4+MT/X2KbLPoKk7DRuPx04dYNlYavQt8
	YNTg==
X-Gm-Message-State: AFeK/H2uqM+3kHintD5Shogr2L/e3HGOtQBtTr+6Vr/nt4iKaF924keP9pUl2R0JReF/Sw0ntUcw8/np4od5vQ==
X-Received: by 10.107.201.196 with SMTP id z187mr5297324iof.172.1490982583554; 
	Fri, 31 Mar 2017 10:49:43 -0700 (PDT)
MIME-Version: 1.0
Sender: carpeddiem@gmail.com
Received: by 10.107.30.209 with HTTP; Fri, 31 Mar 2017 10:49:23 -0700 (PDT)
In-Reply-To: <8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
References: <1490970783-29231-1-git-send-email-minyard@acm.org>
	<8e26dbca-d2be-01bc-bfa3-a73fcb9d1498@redhat.com>
From: Ed Maste <emaste@freebsd.org>
Date: Fri, 31 Mar 2017 13:49:23 -0400
X-Google-Sender-Auth: Skbb6IdQreqNA4kejtnxLBJTlKg
Message-ID: <CAPyFy2C3rQOK_AeyPLWji4LgHS2UdJCa1DFQEG51SGe7D0VR7A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Corey Minyard <minyard@acm.org>, qemu-devel <qemu-devel@nongnu.org>, 
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::22a
Subject: Re: [Qemu-trivial] [PATCH for-2.9? v4] ipmi: Fix macro issues
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
X-List-Received-Date: Fri, 31 Mar 2017 17:49:48 -0000

On 31 March 2017 at 11:04, Eric Blake <eblake@redhat.com> wrote:
>
> Might also be worth adding that an audit of the code finds no semantic
> change, that this is just cleaning up the compiler warning.

We should include core detail of your detailed analysis in such a
statement I think, because I it's more than just cleaning up a
warning. For me at least the warning pointed out that the expression
is not parsed would be expected (if this were a function and not a
macro), and it's just because of constraints on the inputs that
there's no functional change.

>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Ed Maste <emaste@freebsd.org>

