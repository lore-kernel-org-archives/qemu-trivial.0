Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOUJr-0001UM-D5
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 11:46:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOUJo-0001Tp-SC
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 11:46:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1WOUJn-0006wK-Uy
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 11:46:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1WOUJn-0006wF-Mz; Fri, 14 Mar 2014 11:46:43 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EFkgkV015374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 11:46:42 -0400
Received: from colepc.home (ovpn-113-49.phx2.redhat.com [10.3.113.49])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2EFkf8K002597; Fri, 14 Mar 2014 11:46:41 -0400
Message-ID: <53232461.90407@redhat.com>
Date: Fri, 14 Mar 2014 11:46:41 -0400
From: Cole Robinson <crobinso@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1394807976-9469-1-git-send-email-lersek@redhat.com>
	<1394807976-9469-2-git-send-email-lersek@redhat.com>
	<53231549.3090606@redhat.com> <532323B8.2030807@msgid.tls.msk.ru>
In-Reply-To: <532323B8.2030807@msgid.tls.msk.ru>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [trivial PATCH 2.0 1/1] sasl: Avoid 'Could not
 find keytab file' in syslog
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
X-List-Received-Date: Fri, 14 Mar 2014 15:46:45 -0000

On 03/14/2014 11:43 AM, Michael Tokarev wrote:
> 14.03.2014 18:42, Cole Robinson wrote:
>> On 03/14/2014 10:39 AM, Laszlo Ersek wrote:
> [..]
>>> Since the default keytab file "/etc/qemu/krb5.tab" is usually absent, the
>>> cyrus-sasl library emits a warning to syslog at startup, which tends to
>>> annoy users (who didn't ask for gssapi in the first place).
>>>
>>> Comment out the keytab specification per default.
>>>
>>> "qemu-doc.texi" already correctly explains how to use "mech_list: gssapi"
>>> together with "keytab:".
> 
> Thanks, applied to the trivial patches queue...
> 
> 
>> ACK, libvirt has carried a similar change in their sasl config for a while now.
> 
> Is that an "ACKed-by:" ? :)
> 

Yep, sorry.

Acked-By: Cole Robinson <crobinso@redhat.com>

- Cole


