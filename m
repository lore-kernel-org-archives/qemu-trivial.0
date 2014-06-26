Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X06c3-0005v2-AQ
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 06:09:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X06bw-0005ow-KF
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 06:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X06bo-0007jy-Ou
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 06:08:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1X06bZ-0007i1-50; Thu, 26 Jun 2014 06:08:33 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5QA8W1k031431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 26 Jun 2014 06:08:32 -0400
Received: from yakj.usersys.redhat.com (dhcp-176-198.mxp.redhat.com
	[10.32.176.198])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5QA8U1U001862; Thu, 26 Jun 2014 06:08:31 -0400
Message-ID: <53ABF11E.4030508@redhat.com>
Date: Thu, 26 Jun 2014 12:08:30 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
	<877g442kie.fsf@blackfin.pond.sub.org>
In-Reply-To: <877g442kie.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: remove memory
 regions from BAR before destroying them
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
X-List-Received-Date: Thu, 26 Jun 2014 10:09:01 -0000

Il 26/06/2014 09:32, Markus Armbruster ha scritto:
>> > Reported-by: Markus Armbruster <armbru@redhat.com>
>> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
> Would it make sense to add a "must not contain subregions" to
> memory_region_destroy()'s function comment?

I don't know, in the end the assertion is pretty self-explanatory.  If 
we add hotplug support to libqos, we can test it.

Paolo

