Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIt3L-0004bv-Kk
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2019 07:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44216)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIt3H-0004Uf-3G
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIt3F-00057m-2W
 for qemu-trivial@nongnu.org; Fri, 11 Oct 2019 07:25:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iIt3A-00054N-Im; Fri, 11 Oct 2019 07:25:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AC7C518CB8EB;
 Fri, 11 Oct 2019 11:25:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1EFB5DA2C;
 Fri, 11 Oct 2019 11:25:31 +0000 (UTC)
Date: Fri, 11 Oct 2019 13:25:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 2/4] qemu-iotests: remove forceful execution success
 from library files
Message-ID: <20191011112530.GE5158@localhost.localdomain>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-3-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009194740.8079-3-crosa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 11:25:35 +0000 (UTC)
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
X-List-Received-Date: Fri, 11 Oct 2019 11:25:46 -0000

Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> Should not be necessary on files that are not executed standalone.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Looks fine for common.filter and common.rc, nobody ever checks their
return value.

common.config is included like this:

    if ! . "$source_iotests/common.config"
    then
        _init_error "failed to source common.config"
    fi

So as long as we keep this, don't we want to make sure that it returns
success?

Of course, we never really want to return an error from common.config,
so instead of keeping the final 'true' statement, we might consider
changing its inclusion to not check for errors. The case that
potentially changes is when common.config doesn't exist or isn't
readable, but this isn't supposed to ever happen anyway.

Kevin

