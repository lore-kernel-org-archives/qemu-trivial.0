Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lhHgA-0004nP-JT
	for mharc-qemu-trivial@gnu.org; Thu, 13 May 2021 16:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lhHg8-0004mW-QG; Thu, 13 May 2021 16:11:28 -0400
Received: from relay68.bu.edu ([128.197.228.73]:45666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lhHg6-0003Xn-TU; Thu, 13 May 2021 16:11:28 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 14DKA4V2005816
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 13 May 2021 16:10:08 -0400
Date: Thu, 13 May 2021 16:10:04 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Bandan Das <bsd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] tests/qtest/fuzz: Fix build failure
Message-ID: <20210513201004.do4hebp3jk6ruxlp@mozz.bu.edu>
References: <20210513162008.3922223-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210513162008.3922223-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.998,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 13 May 2021 20:11:29 -0000



On 210513 1820, Philippe Mathieu-Daudé wrote:
> On Fedora 32, using clang (version 10.0.1-3.fc32) we get:
> 
>   tests/qtest/fuzz/fuzz.c:237:5: error: implicit declaration of function 'qemu_init' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>       qemu_init(result.we_wordc, result.we_wordv, NULL);
>       ^
> 
> qemu_init() is declared in "sysemu/sysemu.h", include this
> header to fix.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

Thank you

