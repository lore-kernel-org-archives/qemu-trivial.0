Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwYZJ-0000h2-CT
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 09:02:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYZH-0000al-5D
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:02:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYZ9-0001vW-50
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:02:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1SwYYy-0001pv-F7; Wed, 01 Aug 2012 09:02:08 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71D267n008763
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 09:02:06 -0400
Received: from balrog.usersys.tlv.redhat.com (dhcp-4-121.tlv.redhat.com
	[10.35.4.121])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q71D24gw031613; Wed, 1 Aug 2012 09:02:05 -0400
Message-ID: <501928CC.50201@redhat.com>
Date: Wed, 01 Aug 2012 16:02:04 +0300
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
	<1343256304-32029-2-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1343256304-32029-2-git-send-email-tylerwhall@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] exec.c: Use subpages
 for large unaligned mappings
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
X-List-Received-Date: Wed, 01 Aug 2012 13:02:28 -0000

On 07/26/2012 01:45 AM, Tyler Hall wrote:
> Registering a multi-page memory region that is non-page-aligned results
> in a subpage from the start to the page boundary, some number of full
> pages, and possibly another subpage from the last page boundary to the
> end. The full pages will have a value for offset_within_region that is
> not a multiple of TARGET_PAGE_SIZE. Accesses through softmmu are unable
> to handle this and will segfault.
> 
> Handling full pages through subpages is not optimal, but only
> non-page-aligned mappings take the penalty.

Reviewed-by: Avi Kivity <avi@redhat.com>



-- 
error compiling committee.c: too many arguments to function

