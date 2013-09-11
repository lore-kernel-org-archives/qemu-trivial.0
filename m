Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJlns-000321-Pa
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 10:54:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VJlnl-0002sl-OY
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:53:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VJlnf-0002Ux-On
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 10:53:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VJlnT-0002Sd-BQ; Wed, 11 Sep 2013 10:53:35 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8BErSCu004635
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Sep 2013 10:53:29 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-54.ams2.redhat.com
	[10.36.112.54])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8BErP6U007110; Wed, 11 Sep 2013 10:53:26 -0400
Message-ID: <523083EF.7050203@redhat.com>
Date: Wed, 11 Sep 2013 16:53:35 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Gabriel Kerneis <gabriel@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
In-Reply-To: <20130911144230.GA15227@kerneis.info>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Quote extra_cflags in config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 14:53:59 -0000

Il 11/09/2013 16:42, Gabriel Kerneis ha scritto:
> On Wed, Sep 11, 2013 at 04:01:50PM +0200, Paolo Bonzini wrote:
>>> ./configure --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))'"
>>
>> Where does the shell read config-host.mak?  Make does not need the quotes.
> 
> I might have been confused about the shell vs. make interpreting the
> string, but I am positive that without the patch, the following fails:
> 
> mkdir bin/test
> cd bin/test
> ../../configure \
>     --extra-cflags="-Dcoroutine_fn='__attribute__((coroutine_fn))' -w"
> make tests/test-coroutine
> touch ../../configure
> make tests/test-coroutine
> 
> with the following error message:
> 
> config-host.mak is out-of-date, running configure
> sh: 1: Syntax error: "(" unexpected
> make: *** [config-host.mak] Error 2
> 
> My patch fixes this issue.

Oh, then it's this line in configure that has to be changed to do proper
quoting.

printf "# Configured with:" >> $config_host_mak
printf " '%s'" "$0" "$@" >> $config_host_mak

Something like

for arg in "$0" "$@"; do
   quoted_arg=$(echo "$i" | sed 's/[$\\"]/\\&/g')
   printf ' "%s"' "$quoted_arg"
done >> $config_host_mak

could replace the second line.  Adding Eric Blake in case he knows some
extra trick.

Paolo

