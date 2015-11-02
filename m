Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZtHPJ-00055Z-8i
	for mharc-qemu-trivial@gnu.org; Mon, 02 Nov 2015 10:52:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37785)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtHPG-00051Z-PA
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZtHPF-0002k9-VC
	for qemu-trivial@nongnu.org; Mon, 02 Nov 2015 10:52:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZtHPA-0002iS-RH; Mon, 02 Nov 2015 10:52:20 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7E8958EA45;
	Mon,  2 Nov 2015 15:52:20 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA2FqG2B019190
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Nov 2015 10:52:19 -0500
To: Cole Robinson <crobinso@redhat.com>, qemu-devel@nongnu.org
References: <1446473439-10701-1-git-send-email-pbonzini@redhat.com>
	<56377EBC.5030402@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <563786B0.9060300@redhat.com>
Date: Mon, 2 Nov 2015 16:52:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56377EBC.5030402@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-sockets: do not test
 path with access() before unlinking
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
X-List-Received-Date: Mon, 02 Nov 2015 15:52:27 -0000



On 02/11/2015 16:18, Cole Robinson wrote:
>> > -    if ((access(un.sun_path, F_OK) == 0) &&
>> > -        unlink(un.sun_path) < 0) {
>> > +    if (unlink(un.sun_path) < 0) {
>> >          error_setg_errno(errp, errno,
>> >                           "Failed to unlink socket %s", un.sun_path);
>> >          goto err;
>> > 
> This is a serious semantic change, after this patch you will get:
> 
> $ ./x86_64-softmmu/qemu-system-x86_64 -vnc unix:/tmp/idontexist.sock
> qemu-system-x86_64: -vnc unix:/tmp/idontexist.sock: Failed to start VNC
> server: Failed to unlink socket /tmp/idontexist.sock: No such file or directory
> 
> Previously it would 'just work'. Common libvirt usage depends on this as well
> 
> Yeah there's a TOCTTOU race here, but it's very minor: if sun_path is created
> after the access() check, qemu is just going to fail to start since bind()
> will barf if the unix socket path exists.

You're right.  I misread how to test the change.

The right change is what Markus proposed.

Paolo

