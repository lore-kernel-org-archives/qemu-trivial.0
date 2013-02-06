Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U36cy-0000LK-N5
	for mharc-qemu-trivial@gnu.org; Wed, 06 Feb 2013 10:09:36 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44058)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1U36cv-0000Co-R9
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 10:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1U36cq-00017G-90
	for qemu-trivial@nongnu.org; Wed, 06 Feb 2013 10:09:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1U36cq-00016w-1B; Wed, 06 Feb 2013 10:09:28 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r16F9Qbh000900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 6 Feb 2013 10:09:26 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-35.ams2.redhat.com
	[10.36.112.35])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r16F9NqF001946; Wed, 6 Feb 2013 10:09:24 -0500
Message-ID: <51127222.1040904@redhat.com>
Date: Wed, 06 Feb 2013 16:09:22 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <9021f2f9e51e4c7a253d1993ea05f87d0718752f.1359627279.git.mprivozn@redhat.com>
	<510B90C9.8000309@suse.de> <510BDCBF.5040108@redhat.com>
	<20130206144956.GA22233@stefanha-thinkpad.redhat.com>
In-Reply-To: <20130206144956.GA22233@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?ISO-8859-1?Q?Andreas_F=E4?= =?ISO-8859-1?Q?rber?= <afaerber@suse.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Undefine
 _FORTIFY_SOURCE prior using it
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
X-List-Received-Date: Wed, 06 Feb 2013 15:09:35 -0000

Il 06/02/2013 15:49, Stefan Hajnoczi ha scritto:
>> > I don't think that's necessary. The 2nd level is the highest one [1] or [2].
>> > It seems like in my case it's compiler who's defining the macro:
>> > 
>> > $ echo "int main() {return 0;}" | gcc -D_FORTIFY_SOURCE=2 -x c -
>> > <command-line>:0:0: warning: "_FORTIFY_SOURCE" redefined [enabled by default]
>> > <stdin>:1:0: note: this is the location of the previous definition
>> > 
>> > in which case we must undefine it. However, if the _FORTIFY_SOURCE is
>> > defined by environment, I think we should not override it. So maybe need
>> > a different approach. Anyway, with current state I cannot compile. I am using
>> > gcc version 4.7.2 (Gentoo 4.7.2 p1.3, pie-0.5.5)
> It would be nice to fix this for QEMU 1.4 but my gcc FORTIFY_SOURCE foo
> is not strong enough to know what the best approach is here.
> 
> Reviews from anyone else?

I would prefer to avoid having _FORTIFY_SOURCE completely, and let
distros do it.  Alternatively, tie it to a new --enable switch which
would do -U -D.

But if there is a real problem for 1.4 the patch looks good.

Paolo

