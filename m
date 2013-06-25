Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UrQx6-0003x3-Ni
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jun 2013 06:58:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UrQx4-0003wt-BW
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 06:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UrQx3-0003Hr-G8
	for qemu-trivial@nongnu.org; Tue, 25 Jun 2013 06:58:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55741)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UrQx3-0003Hl-8a; Tue, 25 Jun 2013 06:58:21 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5PAwIGQ003454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 25 Jun 2013 06:58:18 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-23.ams2.redhat.com
	[10.36.112.23])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5PAwFT9019157; Tue, 25 Jun 2013 06:58:16 -0400
Message-ID: <51C977C4.5010603@redhat.com>
Date: Tue, 25 Jun 2013 12:58:12 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51C8B6EF.5070108@redhat.com>
	<CAFEAcA-oOr_twUKhOg3j21dmpOkNpMZ-4KYmnxH=W6Qfi1X0vw@mail.gmail.com>
In-Reply-To: <CAFEAcA-oOr_twUKhOg3j21dmpOkNpMZ-4KYmnxH=W6Qfi1X0vw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 25 Jun 2013 10:58:24 -0000

Il 25/06/2013 12:56, Peter Maydell ha scritto:
> On 24 June 2013 22:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> I and Stefan Hajnoczi have almost the same idea implemented in QEMU
>> (except that get_foo() returns a pointer to the variable).  But
>> pthread_get/setspecific would be too slow for cpu_single_env, so we're
>> just switching to __thread for cpu_single_env (for Linux in our patches,
>> but you can add FreeBSD too once it's needed).
> 
> By the way, what's the plan for Windows? Does that support
> __thread too, or will there still need to be some windows
> specific magic?

__thread is supported but slow, so there is a small amount of
Windows-specific magic (but it won't affect the users of tls.h).

Paolo


