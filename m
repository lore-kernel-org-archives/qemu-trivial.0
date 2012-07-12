Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SpFii-0001nD-9v
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2012 05:30:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1SpFib-0001lh-Ay
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 05:29:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1SpFiV-0004ml-8a
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 05:29:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1SpFiV-0004mf-0a; Thu, 12 Jul 2012 05:29:47 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6C9ThV5025174
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 12 Jul 2012 05:29:43 -0400
Received: from dhcp-5-188.str.redhat.com (dhcp-5-175.str.redhat.com
	[10.32.5.175])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6C9TfP8017589
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jul 2012 05:29:42 -0400
Message-ID: <4FFE9904.9080007@redhat.com>
Date: Thu, 12 Jul 2012 11:29:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
References: <1342063681-957-1-git-send-email-wdongxu@linux.vnet.ibm.com>
In-Reply-To: <1342063681-957-1-git-send-email-wdongxu@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, riegamaths@gmail.com,
	stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-img: correct help
	message
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
X-List-Received-Date: Thu, 12 Jul 2012 09:29:59 -0000

Am 12.07.2012 05:28, schrieb Dong Xu Wang:
> qemu-img not only suports k/K/M/G/T/b, but also supports m/g/t/B. So correct
> it in help message.
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> CC: riegamaths@gmail.com
> ---
> v1->v2: also correct error reporting.

This is only true for some cases. For example, img_resize uses a
different parser (parse_option_size), which only supports the format
described here.

There's probably little reason to keep two different parsers, though, so
when the duplication is fixed, the help text can be updated as well.

Kevin

