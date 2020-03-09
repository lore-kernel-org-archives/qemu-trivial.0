Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBHMS-0006ga-Vq
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 08:18:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jBHMP-0006b1-RS
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 08:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jBHMO-0005kZ-Nt
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 08:18:17 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57965)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1jBHMO-0005iS-F6; Mon, 09 Mar 2020 08:18:16 -0400
Received: from [192.168.100.1] ([82.252.135.106]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtfRp-1jTuy31B2l-00v7Og; Mon, 09 Mar 2020 13:18:04 +0100
Subject: Re: [PATCH v3 03/12] block/file-posix: Remove redundant statement in
 raw_handle_perm_lock()
To: Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 zhang.zhanghailiang@huawei.com, Max Reitz <mreitz@redhat.com>,
 Euler Robot <euler.robot@huawei.com>
References: <20200302130715.29440-1-kuhn.chenqun@huawei.com>
 <20200302130715.29440-5-kuhn.chenqun@huawei.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <2e5e3dc1-4853-6ea6-3b98-dc529e4a0509@vivier.eu>
Date: Mon, 9 Mar 2020 13:18:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302130715.29440-5-kuhn.chenqun@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PJCiHkaRJR8HMofr4hJhTAc4ll1/UZisRAj7J3i/SV+b/JYR9FL
 GJM+qhBlRq40xnsZT6FGpSsMrCa4P2NswcE6CDFOkyUu0Oil7+MySjg6sc4lFoqzcvCRvFV
 OOUi3CymlV0DgCMh8Jv+50zMdmRNVjdeSWNkyR1RBjNmdeRdHwDygjEUR/UCV7Ey2q+DoZU
 UE5YHGsscuSSsxDvFwGHw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hfCfatswNzA=:wQfwrGg2fjEjbxHgQe21YQ
 6Uw4AvrGj31ulcpxeDVTbEVem8BTiQb87SGPigfcryAMtzJEthZQyKJP5WifRdYbV5yvHFW20
 FUoVjDd9nWkT9dKYR6jkGocgK0gVinWJMIAU4Fwag8ebObGDhmNFsJXd/pSx+qytyQ0K8xSFq
 pUYoF5lPjrrMM81CnMhUa8MVOBPkVmsMRvrpSNghpd9mKGUioCRStkUeeZopJMChGvXFvXDsN
 3dKZ6oYbrBH3yAqeQcOyB4JMs+AnRcc/Wb4xVbFQsM322EUWjTxLW9RR13o5tGmozvOr9tHYw
 IyZzUJJGlEJOxjDf7tiEEWPD3o/TVdZh4u7y+f6vxYy4t/j0vVTRomeSd/SqXR3llmgMwqGR7
 If3YhkL0dYn/vMXd7ehSF6PuPPokD0w2j+PkRauTM6Xppqlw53+sng/7iw44tSYkcTwexmLML
 sMhWVtf/UoLD1uQwlsd9uGW+Hiw3rdMYtdR+BPWnIeZ0vmPSiWrFYqSc5fcRtr37gr6LDY7Yh
 XcR42zVFgxCWZn6mVJeZw1xeTLXdQ+C/IH/yVls6S3T8L5jOs5LljJx7l68OB/8XaXUc8G9Hi
 a3TNqiIh3ozbkgTIYfd+KIU5+C2b2pTdSWfrKV14neOOBPUvgimlC7i0xlTlsrd5VsJkOb8v8
 EsVUcIzFtVVbvLQuDIQ6Ree68eXz/DQCqKvJYII6LrmXTsWm+w013s442I6kVtny/Lvf2rwx6
 OS5HAYbwdJex0cD+FXh8EnvGCVLpaBkAC32k/LCSL+Ho12X2mJ63kw3NzJexvSKSKkvqUEPQl
 oy/AoRC6psEhhiF0lHXV6DjXEUJ2XtcNiXjLtFUq8Y37CdbhDsoRimD7qmiv0ZzVSJUK3FR
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
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
X-List-Received-Date: Mon, 09 Mar 2020 12:18:20 -0000

Le 02/03/2020 à 14:07, Chen Qun a écrit :
> Clang static code analyzer show warning:
>   block/file-posix.c:891:9: warning: Value stored to 'op' is never read
>         op = RAW_PL_ABORT;
>         ^    ~~~~~~~~~~~~
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> ---
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> ---
>  block/file-posix.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 6345477112..0f77447a25 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -888,7 +888,6 @@ static int raw_handle_perm_lock(BlockDriverState *bs,
>                                "Is another process using the image [%s]?\n",
>                                bs->filename);
>          }
> -        op = RAW_PL_ABORT;
>          /* fall through to unlock bytes. */
>      case RAW_PL_ABORT:
>          raw_apply_lock_bytes(s, s->fd, s->perm, ~s->shared_perm,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

