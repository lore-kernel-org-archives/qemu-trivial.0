Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jr4DH-0007z4-C5
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2020 14:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1jr4DE-0007wk-VZ; Thu, 02 Jul 2020 14:45:32 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1jr4DC-0005Td-SP; Thu, 02 Jul 2020 14:45:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 02AAC400C5;
 Thu,  2 Jul 2020 21:45:26 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id D34126D;
 Thu,  2 Jul 2020 21:45:25 +0300 (MSK)
Subject: Re: [PATCH v3 14/19] .mailmap: Display correct email address for
 Michael Tokarev
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20200702173818.14651-1-f4bug@amsat.org>
 <20200702173818.14651-15-f4bug@amsat.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <dc28e476-a39e-b300-6810-2ed08f3540e9@msgid.tls.msk.ru>
Date: Thu, 2 Jul 2020 21:45:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200702173818.14651-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 14:45:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 02 Jul 2020 18:45:33 -0000

02.07.2020 20:38, Philippe Mathieu-Daudé wrote:
> Fix Michael Tokarev email address in the following commits:
> 
>   $ git log --committer=mjt@gandalf --oneline

Heh. It was a misconfiguration on my part which I haven't noticed
for quite some time.  Dunno if it's worth the effort to fix that
now, since all the commits are old (in 2016), and all are trivial.

/mjt

