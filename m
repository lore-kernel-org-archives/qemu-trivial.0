Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aH9tF-0000h4-7l
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jan 2016 07:42:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aH9tD-0000ee-Eq
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:42:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1aH9tC-0001gk-Ne
	for qemu-trivial@nongnu.org; Thu, 07 Jan 2016 07:42:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1aH9t8-0001eH-Ez; Thu, 07 Jan 2016 07:41:58 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 13B1067C40;
	Thu,  7 Jan 2016 12:41:58 +0000 (UTC)
Received: from [10.36.112.74] (ovpn-112-74.ams2.redhat.com [10.36.112.74])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u07CfrO2000850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Jan 2016 07:41:55 -0500
To: Sitsofe Wheeler <sitsofe@yahoo.com>, qemu-devel@nongnu.org
References: <1451979212-25479-1-git-send-email-sitsofe@yahoo.com>
	<1451979212-25479-3-git-send-email-sitsofe@yahoo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <568E5D11.9030601@redhat.com>
Date: Thu, 7 Jan 2016 13:41:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <1451979212-25479-3-git-send-email-sitsofe@yahoo.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] qemu-nbd: Minor texi updates
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
X-List-Received-Date: Thu, 07 Jan 2016 12:42:04 -0000



On 05/01/2016 08:33, Sitsofe Wheeler wrote:
>  @example
>  @c man begin SYNOPSIS
> -usage: qemu-nbd [OPTION]...  @var{filename}
> +@command{qemu-nbd} [OPTION]... @var{filename}

Could you send another patch that does this change (add @command, remove
"usage:") for the other man pages as well?

Paolo

