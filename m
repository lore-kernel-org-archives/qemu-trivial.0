Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwYTv-0002uL-L0
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 08:56:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYTp-0002cY-24
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 08:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYTn-0008Im-Mg
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 08:56:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65344)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1SwYTh-0008HO-VK; Wed, 01 Aug 2012 08:56:42 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71Cuenh027593
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 08:56:40 -0400
Received: from balrog.usersys.tlv.redhat.com (dhcp-4-121.tlv.redhat.com
	[10.35.4.121])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q71CucMR019533; Wed, 1 Aug 2012 08:56:38 -0400
Message-ID: <50192786.5080904@redhat.com>
Date: Wed, 01 Aug 2012 15:56:38 +0300
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Tyler Hall <tylerwhall@gmail.com>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
In-Reply-To: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] exec.c: Fix off-by-one
	error in register_subpage
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
X-List-Received-Date: Wed, 01 Aug 2012 12:56:54 -0000

On 07/26/2012 01:45 AM, Tyler Hall wrote:
> subpage_register() expects "end" to be the last byte in the mapping.
> Registering a non-page-aligned memory region that extends up to or
> beyond a page boundary causes subpage_register() to silently fail
> through the (end >= PAGE_SIZE) check.
> 
> This bug does not cause noticeable problems for mappings that do not
> extend to a page boundary, though they do register an extra byte.

Reviewed-by: Avi Kivity <avi@redhat.com>


-- 
error compiling committee.c: too many arguments to function

