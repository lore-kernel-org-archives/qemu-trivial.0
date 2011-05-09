Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJM2l-0008Bm-3e
	for mharc-qemu-trivial@gnu.org; Mon, 09 May 2011 04:42:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1QJM2j-00087H-Bv
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 04:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1QJM2i-0003Il-Kg
	for qemu-trivial@nongnu.org; Mon, 09 May 2011 04:42:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63646)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1QJM2g-0003IM-Jr; Mon, 09 May 2011 04:42:14 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p498gCEl021206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 9 May 2011 04:42:12 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-23.phx2.redhat.com
	[10.3.112.23])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p498g9kP018782; Mon, 9 May 2011 04:42:10 -0400
Message-ID: <4DC7A8E0.1020500@redhat.com>
Date: Mon, 09 May 2011 10:42:08 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Lightning/1.0b3pre Mnenhy/0.8.3 Thunderbird/3.1.9
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1304322846-24376-4-git-send-email-pbonzini@redhat.com>	<BANLkTikq7uuwZOhdFdJD4a1PkHneD6a=Fg@mail.gmail.com>	<4DC78F5D.7080505@redhat.com>
	<BANLkTinvh3YJMqJJG9mm27MSYShyBDeZtg@mail.gmail.com>
In-Reply-To: <BANLkTinvh3YJMqJJG9mm27MSYShyBDeZtg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/4] fix compilation when reconfiguring
 without dtrace backend
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
X-List-Received-Date: Mon, 09 May 2011 08:42:18 -0000

On 05/09/2011 10:34 AM, Stefan Hajnoczi wrote:
> BTW the Makefiles don't
> seem to have a step before compilation to generate all the
> dependencies, instead dependencies only kick in after the first build
> has completed?

Yes, the first build doesn't need dependencies on headers.  Rules for 
.c->.o and .o->executable are enough to get everything built.

> Is there some smart change detection you are thinking about or just
> something like keeping the old copy of config-host.h and friends to
> see if they have changed?

Just that, perhaps for both .h and .mak files.  Consider this very 
patch; it is plausible that switching to another tracing backend does 
not change the .h files, right now the backend is only present in .h 
files to enable the monitor/cmdline interfaces.

Paolo

