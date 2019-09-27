Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDtQk-0005LV-6Y
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 12:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48935)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iDtQh-0005HF-PI
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 12:49:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iDtQe-0002X5-FQ
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 12:49:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41062)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iDtQS-0001aC-0j; Fri, 27 Sep 2019 12:49:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CC350C001F03;
 Fri, 27 Sep 2019 16:48:57 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 321EC5D6B0;
 Fri, 27 Sep 2019 16:48:57 +0000 (UTC)
Subject: Re: [PATCH 4/4] qemu-iotests: 044: remove inaccurate docstring class
 description
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20190927141728.7137-1-crosa@redhat.com>
 <20190927141728.7137-5-crosa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b82efd5e-4ecd-25af-e716-cab0d454acf8@redhat.com>
Date: Fri, 27 Sep 2019 11:48:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927141728.7137-5-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 27 Sep 2019 16:48:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 16:49:17 -0000

On 9/27/19 9:17 AM, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/qemu-iotests/044 | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/qemu-iotests/044 b/tests/qemu-iotests/044
> index eb42df0fe1..0ca4bcfc6d 100755
> --- a/tests/qemu-iotests/044
> +++ b/tests/qemu-iotests/044
> @@ -34,7 +34,6 @@ if sys.version_info.major == 2:
>   test_img = os.path.join(iotests.test_dir, 'test.img')
>   
>   class TestRefcountTableGrowth(iotests.QMPTestCase):
> -    '''Abstract base class for image mirroring test cases'''
>   

Should we replace it with something useful?  But this isn't meant to be 
reused outside this test, so it doesn't hurt to have no documentation.

Reviewed-by: Eric Blake <eblake@redhat.com>

>       def preallocate(self, name):
>           fd = open(name, "r+b")
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org

