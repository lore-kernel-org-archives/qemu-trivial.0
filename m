Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb2mJ-000372-9C
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 05:13:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cb2mH-00035a-E1
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 05:13:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1cb2mG-0008Cc-Jc
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2017 05:13:37 -0500
Received: from smtp3.mundo-r.com ([212.51.32.191]:45636 helo=smtp4.mundo-r.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>)
	id 1cb2mB-00083E-FX; Tue, 07 Feb 2017 05:13:31 -0500
IronPort-PHdr: =?us-ascii?q?9a23=3AcrJWXRwcaEi4PifXCy+O+j09IxM/srCxBDY+r6Qd?=
	=?us-ascii?q?1O0WIJqq85mqBkHD//Il1AaPBtSHra0VwLOM+4nbGkU4qa6bt34DdJEeHzQksu?=
	=?us-ascii?q?4x2zIaPcieFEfgJ+TrZSFpVO5LVVti4m3peRMNQJW2aFLduGC94iAPERvjKwV1?=
	=?us-ascii?q?Ov71GonPhMiryuy+4ZPebgFHiTanY75/KBq6oRjPusILnYZsN6E9xwfTrHBVYe?=
	=?us-ascii?q?pW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ7NWCjQmKH0169bwtRbf?=
	=?us-ascii?q?VwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXzmp8qFmQwLqhi?=
	=?us-ascii?q?gaLT406G/ZhMxugqxGoxyhqRNwzJLJb46XOvVzZb/dcc8ASGZdQspcTTJND4Wh?=
	=?us-ascii?q?ZIUPFeoBOuNYopHhqlsKthSxGxOsBP/oyjRVh3H5x7c63PggEQ7cwQctGMkBv2?=
	=?us-ascii?q?rOrNXpM6cfSuG1zKbSwjXHbvNZwy3x55TPchAkuPyBW697f8nJyUQ3Ew7Jk0+c?=
	=?us-ascii?q?pZH4Mz6XzOgAt2yW4/B9We+vi2MqrRx6rCK1ycc2kIbJg5oYylXD9Spk3ok4Pc?=
	=?us-ascii?q?a4SEtnYd68F5tQqj2aO5N2Qsw8R2Fovz43yrMctp69fSkKyZInyADFZ/yGfIiH?=
	=?us-ascii?q?+BbjVOeLLjtimH1lf7e/iw6z8Uim1OL8StG53VJXoiZfj9XAq3IA2wbX58WDUP?=
	=?us-ascii?q?dx40es1DaX2wDW8O5EIEQ0laTBK54mx749joEcvlrZHi/qn0X7l66Wdko+9eis?=
	=?us-ascii?q?6uToeK/qqYObN49xkg3+KLghmtSjAeQkNQgDR3Gb9vq51L3+5EH2XatFjuMona?=
	=?us-ascii?q?ndq53aI8Mbpqi2Aw9Tz4Yv8RG/Dy2p0N4Ah3kIMEpFeA6bj4juI1zOOe73DfKi?=
	=?us-ascii?q?g1i1jDdr3fHGPqPgAprXKnjOi7HhfbF7605Tzgoz0MpT55VOCrEOc7rPXRroud?=
	=?us-ascii?q?nFSxM0LQGw6+DgDtp7y8UZQ23cLLWeNfb7tVWF/P4oa8aFfoQUsX6pIfU/+/nG?=
	=?us-ascii?q?jHAwnV4UO6Ku2M1EOziDAv16LhDBMjLXidAbHDJSsw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BEDwAHnZlY/5tjdVtdGgEBAQECAQEBA?=
	=?us-ascii?q?QgBAQEBFgEBAQMBAQEJAQEBgyYngUONbmSPawsFAYEdBJMnhBuFEoEQAoJfQxQ?=
	=?us-ascii?q?BAQEBAQEBAQEBAWEoQg4BgWIZgh4BBTo/EAsYCSUPBSg0iWYRAbFoi1EBAQEBA?=
	=?us-ascii?q?QEEAQEBAQEjhgiFM4UggmiCEh8Fm2uSAQ2BYwGPH5MPNiF+HxMIFRWGfz81gky?=
	=?us-ascii?q?GUgEBAQ?=
X-IPAS-Result: =?us-ascii?q?A2BEDwAHnZlY/5tjdVtdGgEBAQECAQEBAQgBAQEBFgEBAQM?=
	=?us-ascii?q?BAQEJAQEBgyYngUONbmSPawsFAYEdBJMnhBuFEoEQAoJfQxQBAQEBAQEBAQEBA?=
	=?us-ascii?q?WEoQg4BgWIZgh4BBTo/EAsYCSUPBSg0iWYRAbFoi1EBAQEBAQEEAQEBAQEjhgi?=
	=?us-ascii?q?FM4UggmiCEh8Fm2uSAQ2BYwGPH5MPNiF+HxMIFRWGfz81gkyGUgEBAQ?=
X-IronPort-AV: E=Sophos;i="5.33,345,1477954800"; d="scan'208";a="157860374"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 Feb 2017 11:13:29 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1cb2m9-00018J-Bt; Tue, 07 Feb 2017 11:13:29 +0100
Received: from berto by mail.igalia.com with local (Exim)
	id 1cb2m9-0005z1-9C; Tue, 07 Feb 2017 11:13:29 +0100
Date: Tue, 7 Feb 2017 11:13:29 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <20170207101329.GA22703@igalia.com>
References: <20170127094154.19778-1-berto@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170127094154.19778-1-berto@igalia.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.51.32.191
Subject: Re: [Qemu-trivial] [PATCH] qemu-doc: Clarify that -vga std is now
 the default
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
X-List-Received-Date: Tue, 07 Feb 2017 10:13:38 -0000

On Fri, Jan 27, 2017 at 11:41:54AM +0200, Alberto Garcia wrote:
> The QEMU manual page states that Cirrus Logic is the default video
> card if the user doesn't specify any. However this is not true since
> QEMU 2.2.
> 
> Signed-off-by: Alberto Garcia <berto@igalia.com>

Ping

Berto

