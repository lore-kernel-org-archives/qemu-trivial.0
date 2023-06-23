Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qCgiR-0004Uu-MK
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2023 09:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qCgiM-0004Ti-FD; Fri, 23 Jun 2023 09:20:39 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qCgiK-0008IZ-1L; Fri, 23 Jun 2023 09:20:38 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qnd8G2VRGz6J7Xv;
 Fri, 23 Jun 2023 21:17:50 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 23 Jun
 2023 14:20:31 +0100
Date: Fri, 23 Jun 2023 14:20:30 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Thomas Huth <thuth@redhat.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, Fan Ni
 <fan.ni@samsung.com>
Subject: Re: [PATCH] tests/qtest/cxl-test: Clean up temporary directories
 after testing
Message-ID: <20230623142030.00001c15@Huawei.com>
In-Reply-To: <20230622114132.372898-1-thuth@redhat.com>
References: <20230622114132.372898-1-thuth@redhat.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Jun 2023 13:20:41 -0000

On Thu, 22 Jun 2023 13:41:32 +0200
Thomas Huth <thuth@redhat.com> wrote:

> It's good style to clean up temporary directories when they
> are not needed anymore.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  tests/qtest/cxl-test.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> index edcad4a0ce..a600331843 100644
> --- a/tests/qtest/cxl-test.c
> +++ b/tests/qtest/cxl-test.c
> @@ -124,6 +124,7 @@ static void cxl_t3d_deprecated(void)
>  
>      qtest_start(cmdline->str);
>      qtest_end();
> +    rmdir(tmpfs);
>  }
>  
>  static void cxl_t3d_persistent(void)
> @@ -138,6 +139,7 @@ static void cxl_t3d_persistent(void)
>  
>      qtest_start(cmdline->str);
>      qtest_end();
> +    rmdir(tmpfs);
>  }
>  
>  static void cxl_t3d_volatile(void)


