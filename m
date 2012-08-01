Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwWAA-0002V2-TQ
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 06:28:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWA7-0002QK-Lz
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:28:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SwWA1-0004Ob-Md
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 06:28:19 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:42058)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SwWA1-0004OS-GV; Wed, 01 Aug 2012 06:28:13 -0400
Received: by wibhm2 with SMTP id hm2so2953843wib.10
	for <multiple recipients>; Wed, 01 Aug 2012 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dd0saLpcO37CXdUIX2pXLbUoWWkWUVAaHT0BHolc6+Y=;
	b=SRRDWiIZa8q43rwBY1f6n1v8H8zpT/zRbA2doW9wMAi7j6Zj71aFh38x+3k+C3te3z
	TWtGvTMvJvX2oOFUEsCTTn2cOpSueUgXB9Jmi1/bAXfrA///ceOkD5P/r3aPgK7Cp4a8
	fem16O8LNi6a4QOpbZdR7Qcp+eq+/ehqADWhzZWkExvfdW7ixKHFbspSzgaKXOxsZIpY
	t5fqaTQxQlhjOS2L27iNRlMvSsJTNlpGdVs0VN+B5QltrhW/J8mkLTDeWGNgiFjGv5ao
	4DDvXli+ONY6IzmEFkzrW5WB8Ku6gbZcs4tvm2BojZ6HgPZJOgw4tswZBBK/EK7aqMep
	OxgA==
Received: by 10.216.54.146 with SMTP id i18mr8063782wec.187.1343816892593;
	Wed, 01 Aug 2012 03:28:12 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id cu1sm27230086wib.6.2012.08.01.03.28.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 03:28:12 -0700 (PDT)
Date: Wed, 1 Aug 2012 11:28:10 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20120801102810.GA17816@stefanha-thinkpad.localdomain>
References: <1343739695-7757-1-git-send-email-peter.maydell@linaro.org>
	<87pq7c9fng.fsf@blackfin.pond.sub.org>
	<5017EABA.1020005@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5017EABA.1020005@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: Peter Maydell <peter.maydell@linaro.org>, patches@linaro.org,
	qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Avoid explicit
 list of directories in clean target
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
X-List-Received-Date: Wed, 01 Aug 2012 10:28:20 -0000

On Tue, Jul 31, 2012 at 08:24:58AM -0600, Eric Blake wrote:
> On 07/31/2012 08:19 AM, Markus Armbruster wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > 
> >> Avoid having an explicit list of directories in the 'clean'
> >> target by using 'find' to remove all .o and .d files instead.
> >>
> 
> >>  	rm -f qemu-options.def
> >> -	rm -f *.o *.d *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
> >> +	find . -name '*.[od]' | xargs rm -f
> >> +	rm -f *.a *.lo $(TOOLS) $(HELPERS-y) qemu-ga TAGS cscope.* *.pod *~ */*~
> > 
> > Shit happens if you somehow manage to create a "mean" file name in the
> > build tree.  Sure you don't want to -print0 | xargs -0?
> 
> Except that 'find -print0' and 'xargs -0' are both GNU extensions, not
> available everywhere.  We may be requiring gmake and gcc, but are we
> also requiring GNU find?
> 
> The POSIX way to write this, without relying on extensions, is:
> 
> find . -name '*.[od]' -exec rm -f {} +
> 
> (although then you get into the arguments of whether 'find -exec {} +'
> is portable yet, even though it has now been required by POSIX for more
> than 4 years.)

This portable approach seems reasonable.  I have checked the find(1) man
page on: FreeBSD, OpenBSD, Solaris 11, Mac OS X.

Let's give find -exec + a shot.  If it breaks something then the folks
who care can provide a buildslave to ensure their host platform
continues to be supported in the future.

Stefan

