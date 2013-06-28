Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Usaht-0008A6-0D
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 11:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Usahl-0007z6-UI
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 11:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Usahh-0005dz-7Q
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 11:35:21 -0400
Received: from mail-qc0-x22f.google.com ([2607:f8b0:400d:c01::22f]:39069)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UsahY-0005aB-1f; Fri, 28 Jun 2013 11:35:08 -0400
Received: by mail-qc0-f175.google.com with SMTP id k14so1421678qcv.6
	for <multiple recipients>; Fri, 28 Jun 2013 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zqCoDXTKqRfIVsOY1Z3Ptsi/0EWYWC+c9ZnQnF17rRQ=;
	b=wbd+HXAkJE8DAeHZBR1zN261X1GBXKPteJquUd8+Togv/dwmc5XEtpXQ1xirgbZoME
	bAVgFVsCV2iiStdT4IOPLb4pZreapZUYsyP2sG2t2dsHqJF+i8NAvruTaoxlL4vV7Vtk
	mNZ4j6fSgDPPz+NjdmPeBBQ4RTrOzaibTg7WxsyZim2VWqRLTaE0HhHz6ufGaS/TlXwL
	Uc4R75yWgOAMskVSo77AhERKH8ZQdifA9Y32jyUAsZ/7r1zJ6qoDy5B9HYuV8PW5yGwn
	fhcyjg0trqX6O8n2FVxmkfkmqhxN9hUWty/DfvDtDyZokqCIj25uc2yHZ6KhvXXgbvvV
	Wh5g==
MIME-Version: 1.0
X-Received: by 10.224.105.199 with SMTP id u7mr18649875qao.33.1372433707654;
	Fri, 28 Jun 2013 08:35:07 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.180.78 with HTTP; Fri, 28 Jun 2013 08:35:07 -0700 (PDT)
In-Reply-To: <51CDA797.9000803@redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
	<51CDA1E7.9000100@redhat.com>
	<CAFEAcA-8n0GEYd3Rif-XGaPaC1vwKk_eYJKu2Z8VMyKp-0-nfw@mail.gmail.com>
	<51CDA797.9000803@redhat.com>
Date: Fri, 28 Jun 2013 11:35:07 -0400
X-Google-Sender-Auth: d9e36rHq92O-5fL8pNcUsVH2qTk
Message-ID: <CAPyFy2D8wnCkKMF4TAB=PFt0y8Ld2LmYA=17D_sakdvR7Mkjtw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::22f
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 15:35:27 -0000

On 28 June 2013 11:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
> And of course if bsd-user supported 1:1 mapping between guest and host
> threads on FreeBSD, cpu_single_env would have to be thread-local.

This is the case for the bsd-user work that Stacey posted at the
beginning of the week and is currently being revised after the initial
round of comments.

Can you comment on how quickly your tls work is expected to arrive?
We'll have to rebase on top of it, if it's in the next few days or so.
 If it's longer than that we'll need this change as a prerequisite for
the bsd-user work.

After Peter suggested splitting this change out I sent it to -trivial
because I already had it in a test tree, and it has no effect on
non-FreeBSD hosts.  If it's really objectionable right now we can
include it with v2 of the bsd-user series.

