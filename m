Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ko9UC-0000v5-P1
	for mharc-qemu-trivial@gnu.org; Sat, 12 Dec 2020 13:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ko9UA-0000oX-1S; Sat, 12 Dec 2020 13:19:14 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:56809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ko9U8-0002AL-CK; Sat, 12 Dec 2020 13:19:13 -0500
Received: from [192.168.100.1] ([82.252.152.214]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MVvCn-1kePWS1VC9-00Rlxq; Sat, 12 Dec 2020 18:11:01 +0100
Subject: Re: [PATCH V2 08/14] m68k/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>, qemu-trivial@nongnu.org
Cc: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Philippe Mathieu-Daude <f4bug@amsat.org>
References: <20201009064449.2336-1-zhaolichang@huawei.com>
 <20201009064449.2336-9-zhaolichang@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f790ec0a-1f0d-90fd-f597-20fddad9a60c@vivier.eu>
Date: Sat, 12 Dec 2020 18:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201009064449.2336-9-zhaolichang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nQ/PZ7i/hsP3K8mOjUZfggSMGcy2N59j1FbepDK7Z6c2FRtIXSP
 B39lIhq4I2DfdAmGwL5A21cSUNIEfyEneIgXvQbqdFYGaSDKoGVLo+3KTww3BwcxoGSw8Lb
 HdAmRRiij+Fti/AVy6zeQJlk8inMke1I6r44I5e4pEhRBL1gE1/o+QWTT0r0Yxnp7rJAhvX
 MWv1oemsG6yJNImpqqsBA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KyQ1jiZb1nM=:ARdnARkeJRliaogJlEV0yn
 pkJEqgEE9W/PpTcTHbvyjQgODKSyrbjQIbH70gESOEoXl5VnysXnGw/aNBfhllZ1Mioy0LYy+
 vKsHX2zZ9OLq+eZCaUPtYH4aW2hfm5NiN6R0dWk6S6Hm7fCPDGaaeg5ZGkLshopnxxqN4+N3G
 niwVzji1lopq3n58azHNZ1WSZorLGL1YiEGH+1qhu6uyK+yDJmQ1X8JW9NcWqF6ouFv3uagOu
 73vdKiNu6Z4FRdv7hUxRsRELp49hf8npg/aCow+HLd8+repT+bW91feiLl7ff88lIHp72kkSc
 TUZvdaogGkghroMx/ZRIH0CAH/Y3kLV8R3B7wCxnjEm8receFzmmugemjYa08YwX9hHKCNVrZ
 4KPd170UIMcZGEIiWlXseNQ5uft0h94e2BtCEWJmmmEEgDg7bvrPmoErHPY/lw61bTnIob8Wr
 iw+9Lz2ZFA==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Sat, 12 Dec 2020 18:19:14 -0000

Le 09/10/2020 à 08:44, zhaolichang a écrit :
> I found that there are many spelling errors in the comments of qemu/target/m68k.
> I used spellcheck to check the spelling errors and found some errors in the folder.
> 
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> Reviewed-by: David Edmondson <david.edmondson@oracle.com>
> Reviewed-by: Philippe Mathieu-Daude<f4bug@amsat.org>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---
>  target/m68k/translate.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Applied to my m68k-for-6.0 branch

Thanks,
Laurent


