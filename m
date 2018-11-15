Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNQH0-000059-1V
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 17:38:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNQGy-0008VA-EY
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 17:38:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1gNQGw-0005AP-FE
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 17:38:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:12847)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1gNQGp-00054Y-0Q; Thu, 15 Nov 2018 17:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53495C050014;
	Thu, 15 Nov 2018 22:37:39 +0000 (UTC)
Received: from [10.10.123.32] (ovpn-123-32.rdu2.redhat.com [10.10.123.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B10F461D26;
	Thu, 15 Nov 2018 22:37:37 +0000 (UTC)
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, xiezhide@huawei.com,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20181115215449.1300769-1-eblake@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b600b483-0e46-5c2e-f52b-2f330ebaa5a7@redhat.com>
Date: Thu, 15 Nov 2018 16:37:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115215449.1300769-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 15 Nov 2018 22:37:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qapi: Reduce Makefile
 boilerplate
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2018 22:38:05 -0000

On 11/15/18 3:54 PM, Eric Blake wrote:
> Adding a new qapi module had some rather tedious repetition to
> wire it into Makefile. Add some indirection by taking advantage
> of GNU Make string processing to expand a list of module names
> into all the required artifacts, so that future additions of a
> new module need only touch the list of module names.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> I finally found time to follow through with my threats to make it
> MUCH easier to add a new qapi/FOO.json file.
> 
> Should be no semantic change, but as it is not fixing an actual
> bug, I don't care if it goes in 3.1 or 4.0.
> 
>   Makefile | 194 +++++++------------------------------------------------
>   1 file changed, 25 insertions(+), 169 deletions(-)

I'm trying to do the same thing to Makefile.objs, but when I use:

common-obj-y += $(QAPI_MODULES:%=qapi/qapi-commands-%.o)

or the longer $(patsubst %,qapi,qapi-commands-%.o,$(QAPI_MODULES))

both before and after the change, 'make print-common-obj-y | grep qapi' 
returns identical content, but after the change, the linker fails with:

   LINK    x86_64-softmmu/qemu-system-x86_64
monitor.o: In function `monitor_init_qmp_commands':
/home/eblake/qemu/monitor.c:1200: undefined reference to 
`qmp_marshal_qmp_capabilities'
monitor.o: In function `qmp_greeting':
/home/eblake/qemu/monitor.c:4342: undefined reference to 
`qmp_marshal_query_version'
../qapi/qapi-commands.o: In function `qmp_init_marshal':
/home/eblake/qemu/qapi/qapi-commands.c:30: undefined reference to 
`qmp_marshal_query_status'
...

So something about variable expansions is NOT playing nicely with our

dummy := $(call unnest-vars,, \
                 stub-obj-y \
                 chardev-obj-y \
...
                 common-obj-y \

that builds up the set of files the linker needs to see.  But I have 
_no_ idea what is going wrong that makes unnest-vars unable to see 
through a variable expansion of .o files.  Ideas on how to compress 
Makefile.objs to avoid the redundancy would be appreciated.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

