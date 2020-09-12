Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHAnK-0006IN-GK
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 15:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kHAnJ-0006I4-Ak
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 15:02:41 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:47741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kHAnH-0004kG-3F
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 15:02:41 -0400
Received: from [192.168.100.1] ([82.252.129.222]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MRTIx-1jtr17425t-00NRMa; Sat, 12 Sep 2020 21:02:29 +0200
Subject: Re: [PATCH v2 0/2] hw/timer/hpet: Trivial format string fix
To: Dov Murik <dovmurik@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
 <35c826f7-bfbf-9e74-ad86-ef2d3262828f@redhat.com>
 <2d4ff491-de20-944f-dabd-f35d6a81b53d@linux.vnet.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <254802cd-2e4e-8506-2bd4-ce7cc0dad23e@vivier.eu>
Date: Sat, 12 Sep 2020 21:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2d4ff491-de20-944f-dabd-f35d6a81b53d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bKxPnmC9VHGlnG4HJtvWswbAbm6CfU64pvv3f1bY88Nnp+WOANy
 +7z8LyRZSsvs+ZxH2Qo1cjM5+Hs3Bw9THnM1RRd8D2o0Ffln3Y3qiI7jpaa/Xe97f+vifvJ
 W+eDaompTgkdmdu+R0pk5XgBsplLBuS2cro0oIf0txCwoHdWJoDgvKxGm1LauPZc5T9zpM9
 gNcd8rF0eJinr6eUeAM+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:65nCTFXHs9M=:JERuHUT3/ANlIA+Gj+GIK0
 8CqCsr8xKhxQoobSKt5KJhPgr5IdSpW5TgkGnzuhGrnKu0DU3oItsTO8meA+HzXK9rBIlKPWE
 ApX5Yfe6O3N4mSTQ2GvqswCmbM5P1BuHuFEbrgch7GzVlsmOTjxazOiIMfdWiRmMTCeouTqav
 LDR2aMiRtqrxuM54ibto85lP52Zm+Gohg9LVF+MqoTCytuUEYY4tCQuG2qGS4kqu6vVe4TWHq
 SfuwQFfhOFiaQYnJr23o9nlANz4pjlqOCVHPZ7vPQaRWsZ9WTh47xpiZucbnfAMSKA2g8Rz1m
 hJfFtYUOE1aTId3w54hur3OL45xZX58CD7MOb7E4GfHP511LQqBgIB2lrZbzkzrTk4dtHtxAp
 DC8gxsSNSKipzgmEZHZgQNQ/xAyr+hNmD3jW42sDdCLtpJFYIEi5kMDGP1lYM+iwWpRrfnh1p
 T3qRsrn85jdaJxQwJHc+Xv3sDE/Yupc5CAzHPGO2193oinBf9WerWPnUOXrMb3Qy9SJxNnt4r
 DFcv5eUUSSzjpVrese96+tIGFACfFdiuN6BLYUlQYhc4AGMafTXPlX95JI3QCw9DFWGeM1iov
 RtBmecB0cf+LEKOfZS1/BeWI0aoNlD553Vh1k2VDxScfsKfqyDNR6lfDMZLXTu6FEb7VBoviU
 Px5fY76NbUem0XnK9CMtY2UGzxIgi4SJFwrJc/+t8P8rXjCL6VE2lmXwi3Rr7vu+zYI2P654n
 AENzLdzjrccUBtp6YvVEDf+0eNzEyhRtoZszzQGX4AaGdtEkmS1TxeR3UGQx/E+1bm9kAM9d9
 4EPGEr9PmfrKpldY8SPdemg03nZ//WjlyS7L955oy2/skA1c18/GBwqVoAXhQoV+4KNEm9k
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 15:02:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.543,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 12 Sep 2020 19:02:41 -0000

Le 12/09/2020 à 19:34, Dov Murik a écrit :
> 
> 
> On 10/09/2020 17:08, Philippe Mathieu-Daudé wrote:
>> On 9/10/20 3:58 PM, Philippe Mathieu-Daudé wrote:
>>> Fix a format string and remove dead code.
>>>
>>> Since v1:
>>> - Addressed Dov comments (fix format string + style):
>>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg739239.html
>>
>> Dov, since you sent the same patches/code and sign them with
>> your S-o-b, I added them here too, is that OK with you?
> 
> Yes, thank you for that.
> 
>>
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    hw/timer/hpet: Remove dead code
>>>    hw/timer/hpet: Fix DPRINTF format string
>>>
>>>   hw/timer/hpet.c | 23 ++++++-----------------
>>>   1 file changed, 6 insertions(+), 17 deletions(-)
>>>
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


