Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsakT-0001RU-C4
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 11:38:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UsakQ-0001O3-8p
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 11:38:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1UsakN-0006Jp-R4
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 11:38:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1UsakN-0006Jj-IG; Fri, 28 Jun 2013 11:38:03 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5SFc04h016603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 28 Jun 2013 11:38:00 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-50.ams2.redhat.com
	[10.36.112.50])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5SFbvfw028558; Fri, 28 Jun 2013 11:37:58 -0400
Message-ID: <51CDADD2.2010405@redhat.com>
Date: Fri, 28 Jun 2013 17:37:54 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
	<51CDA1E7.9000100@redhat.com>
	<CAFEAcA-8n0GEYd3Rif-XGaPaC1vwKk_eYJKu2Z8VMyKp-0-nfw@mail.gmail.com>
	<51CDA797.9000803@redhat.com>
	<CAPyFy2D8wnCkKMF4TAB=PFt0y8Ld2LmYA=17D_sakdvR7Mkjtw@mail.gmail.com>
In-Reply-To: <CAPyFy2D8wnCkKMF4TAB=PFt0y8Ld2LmYA=17D_sakdvR7Mkjtw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Fri, 28 Jun 2013 15:38:07 -0000

Il 28/06/2013 17:35, Ed Maste ha scritto:
> On 28 June 2013 11:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> And of course if bsd-user supported 1:1 mapping between guest and host
>> threads on FreeBSD, cpu_single_env would have to be thread-local.
> 
> This is the case for the bsd-user work that Stacey posted at the
> beginning of the week and is currently being revised after the initial
> round of comments.
> 
> Can you comment on how quickly your tls work is expected to arrive?
> We'll have to rebase on top of it, if it's in the next few days or so.

Maybe a week or two.

To simplify rebase, if you want you can take the conflicting patch from
http://article.gmane.org/gmane.comp.emulators.qemu/216583/raw.

>  If it's longer than that we'll need this change as a prerequisite for
> the bsd-user work.
> 
> After Peter suggested splitting this change out I sent it to -trivial
> because I already had it in a test tree, and it has no effect on
> non-FreeBSD hosts.  If it's really objectionable right now we can
> include it with v2 of the bsd-user series.

Yes, that would be preferrable, either with or without the patch above.

Paolo

