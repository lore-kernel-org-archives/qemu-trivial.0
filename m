Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YW8cL-000825-BF
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 15:18:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW8cI-00081O-QC
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 15:17:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW8cD-0001BX-Df
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 15:17:58 -0400
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:37803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aneesh.kumar@linux.vnet.ibm.com>) id 1YW8cC-0001B1-Rb
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 15:17:53 -0400
Received: from /spool/local
	by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aneesh.kumar@linux.vnet.ibm.com>;
	Fri, 13 Mar 2015 00:47:48 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
	by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 13 Mar 2015 00:47:46 +0530
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by d28dlp03.in.ibm.com (Postfix) with ESMTP id 48D9E125842B;
	Thu, 12 Mar 2015 19:03:45 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay03.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	t2CDQq0E23199812; Thu, 12 Mar 2015 19:02:17 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	t2C9sFw3026693; Thu, 12 Mar 2015 15:24:15 +0530
Received: from skywalker.linux.vnet.ibm.com (skywalker.in.ibm.com
	[9.193.66.152])
	by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2C9s0Ug025577
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Thu, 12 Mar 2015 15:24:08 +0530
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
In-Reply-To: <1426143150-5641-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1426143150-5641-1-git-send-email-mjt@msgid.tls.msk.ru>
User-Agent: Notmuch/0.19+30~gd241a48 (http://notmuchmail.org) Emacs/24.3.1
	(x86_64-pc-linux-gnu)
Date: Thu, 12 Mar 2015 15:23:55 +0530
Message-ID: <8761a6bky4.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15031219-0025-0000-0000-000003C03742
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 122.248.162.7
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [PATCH v2] 9pfs-local: simplify/optimize
	local_mapped_attr_path()
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
X-List-Received-Date: Thu, 12 Mar 2015 19:17:59 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Omit one unnecessary memory allocation for components
> of the path and create the resulting path directly given
> lengths of the components.
>
> Do not use basename(3) because there are 2 versions of
> this function which differs when argument ends with
> slash character, use strrchr() instead so we have
> consistent result.  This also makes sure the function
> will do the right thing in corner cases (eg, empty
> pathname is given), when basename(3) return entirely
> another string.
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Applied.

Thanks
-aneesh


