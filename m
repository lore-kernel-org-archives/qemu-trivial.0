Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fT4lN-0000Ac-J7
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 08:20:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT4lI-000093-PK
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:20:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1fT4lH-0001iM-UR
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 08:20:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57404 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1fT4lD-0001XM-1W; Wed, 13 Jun 2018 08:20:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 670824040073;
	Wed, 13 Jun 2018 12:20:22 +0000 (UTC)
Received: from [10.10.120.103] (ovpn-120-103.rdu2.redhat.com [10.10.120.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 314882026609;
	Wed, 13 Jun 2018 12:20:21 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <1528866321-23886-1-git-send-email-thuth@redhat.com>
	<1528866321-23886-2-git-send-email-thuth@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Ben Warren
	<ben@skyportsystems.com>, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, zhang.zhanghailiang@huawei.com
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b4b86190-1f16-758b-448f-b3766327d635@redhat.com>
Date: Wed, 13 Jun 2018 07:20:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1528866321-23886-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 12:20:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 13 Jun 2018 12:20:22 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eblake@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/4] Replace '-machine
 accel=xyz' with '-accel xyz'
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
X-List-Received-Date: Wed, 13 Jun 2018 12:20:32 -0000

On 06/13/2018 12:05 AM, Thomas Huth wrote:
> We've got a separate option to configure the accelerator nowadays.
> Use it in the source and examples to demonstrate that this is the
> preferred way of setting this option now.

Is it worth bike-shedding the preferred spelling as '--accel xyz', to 
match 
https://wiki.qemu.org/BiteSizedTasks#Consistent_option_usage_in_documentation?

It's more important to use double-dash for options shared between 
binaries, but qemu-nbd and qemu-img don't use --accel, so that makes the 
argument slightly weaker for the doubled form here.

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

