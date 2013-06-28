Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsYCN-0008AJ-Mn
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 08:54:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UsYCK-00086S-Ml
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 08:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UsYCH-00042T-WF
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 08:54:44 -0400
Received: from mail-qe0-x234.google.com ([2607:f8b0:400d:c02::234]:57335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UsYC9-00040g-6A; Fri, 28 Jun 2013 08:54:33 -0400
Received: by mail-qe0-f52.google.com with SMTP id i11so648914qej.25
	for <multiple recipients>; Fri, 28 Jun 2013 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=pH5DYOUQSTKRrvmq80dyV9tQA93YGiEe05LnqcqmBOY=;
	b=tojSuD9MUwepFqn8LT5kOR+cSmmx4WPOrEvU6O0VPCoo/BL/4eHTO7R/dF/QzwiUcb
	ac92eqFVSnyfAnaE+vsI6p9yYVWncom9KH6Q228HLTDIfez02UX9Shxuvf3erReggp1w
	6Wd+0OppDynsqOnsOMt99huo91Wo8JGSSE+B9fkD94CFVIsZxePP6Iti9L7TSy6zYYFy
	JKxMQZYk7Tvypwhiuy0be3oqa+Vn3FDUzca9DuChijb5UdHyu7Ia1hZh7SFO8NoqWYuT
	T3l3hjA3Wr1ErCzifE9SBFs8YXF3fCi4ARXZxO9H+QgGwu7mSR8fHZBbO76PmklO84g8
	Jpeg==
MIME-Version: 1.0
X-Received: by 10.224.78.11 with SMTP id i11mr17745767qak.29.1372424072568;
	Fri, 28 Jun 2013 05:54:32 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.180.78 with HTTP; Fri, 28 Jun 2013 05:54:32 -0700 (PDT)
In-Reply-To: <51CD669A.1010100@msgid.tls.msk.ru>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
Date: Fri, 28 Jun 2013 08:54:32 -0400
X-Google-Sender-Auth: jZWLdgWFBWOpzdVIL7iXae_O7b8
Message-ID: <CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::234
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 12:54:47 -0000

On 28 June 2013 06:34, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 24.06.2013 23:21, Ed Maste wrote:
>> Signed-off-by: Ed Maste <emaste@freebsd.org>
>> ---
>> I have had this in a local tree for some time, and it is needed by the
>> BSD-user work that is now being proposed.
>
> So I'm not applying this to -trivial, because it caused quite some
> discussion.  If nevertheless it's okay to apply it, please let me know.
>
> /mjt

An objection seemed to be that it is not really needed yet, but as
pointed out by Peter this isn't really the case.  This patch brings us
(FreeBSD) in line with per-thread data semantics on Linux and is used
by qemu system emulation as well.

The other discussion was all around platforms unaffected by this
change (OpenBSD, Windows); I don't see it as an argument either for or
against this change.  So I think it's reasonable to go in.

