Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eFLUY-0002Qv-MN
	for mharc-qemu-trivial@gnu.org; Thu, 16 Nov 2017 09:50:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1eFEgS-0001vh-DC
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 02:34:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vsementsov@virtuozzo.com>) id 1eFEgP-0003LG-9Z
	for qemu-trivial@nongnu.org; Thu, 16 Nov 2017 02:34:00 -0500
Received: from mail-eopbgr00105.outbound.protection.outlook.com
	([40.107.0.105]:14144
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
	id 1eFEgO-0003Gp-Q0; Thu, 16 Nov 2017 02:33:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
	s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
	bh=ULwq/TJaFEzuw69NZP5sWWeav3arYftZulNYySqQwY8=;
	b=VhF360hzb5vK+UCkcahAg6z2UXTUXPHEEYk0JeRMlfqaBVF348AQZG+wXDcN8l3fhfXRhQWOrTGmsH9nytiopBexbO/8jPCdHXJ0oYbcr3YIELSAlH/zC98r3NoM4gtqr2tWGHnMVZp/eVy0b9u34ac44dl2zj1hic+vJ+SM9cc=
Received: from [172.16.24.243] (195.214.232.6) by
	DB6PR0801MB2054.eurprd08.prod.outlook.com (2603:10a6:4:77::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Thu, 16 Nov 2017 07:33:52 +0000
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
References: <20171113194857.13933-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <c844bfa1-d976-07eb-04e5-6dfa54b48635@virtuozzo.com>
Date: Thu, 16 Nov 2017 10:33:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171113194857.13933-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [195.214.232.6]
X-ClientProxiedBy: DB6PR0202CA0012.eurprd02.prod.outlook.com
	(2603:10a6:4:29::22) To DB6PR0801MB2054.eurprd08.prod.outlook.com
	(2603:10a6:4:77::7)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1eb6c695-c914-4f2d-99c1-08d52cc4637d
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(7168017)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:DB6PR0801MB2054; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0801MB2054;
	3:IBYBEVBgqF1eDFbHRtTBsYwDG/AgFJ1jl/QpUKivEAFr3AXeQs6PBdamzPR/gZHG2+emwlVkxdup2URt8dAZCOoDb94p/qz9XSEoSkoDjivOG7JddkWIP0fbWTiNH+ljCCHiesLzerAKlWbawOKTf0Fd/Te7ggzALHREFMUbK9QFxbwr53AjxnUghg7MXlesTf0iKtJF40cCs2e3S5CszmTEvAsZ53rO9QzPEhibFMpxCEbbaZXT0LvCaftLZWw6;
	25:hH4tNkwa5H/OiU+J3vrSxTwg2eEh2vKKdFSBSNdRgNlJKIDiTOci42vPXP6LEp6grfYGLpNgdYqbOYygnx+RBW0cgsz5kjejftNj5JUXBrmk0yAQC6h3mOgbJx638YxvUjV6r96PfxzcOJWCpnRFqBA7+MP+HCSrru/r8VGj1t69uWI270hCVDaXW+2DkVNfWzBIYPUu9i1AZThYz8V4bObDPu+8tFuq0ybll0AiUZ26qFDdJE9e3ONW2L4R+Gu0hPDySrEhFQ4ThaHaAobo+bUiNK21s0RWuei/ny79k/T1XozAbE7Ev6WmNRN4UZCN/Yg3TAACes3ME49aIbuSfw==;
	31:6VvT4eQN+KPseRRBw/9IFJdgHQcq+gkAsOiv0as12TQQsgfOi4przsLhTbb1ixUzpPzog78tftvEQJTc/UZSrPomwAtduGyzPsfjhRDp0KtQH8bQZUx61905tggdkb9MAlFR07kZD3wG0tqGQ+oU2a9MNKkzWF1EEATXIUag78xCMuaoNtv6BVSuiJ2zbNSGOqkPplbyMi5T0YyRGxbAuGKGPM8Gxes4hLdbvOrHuA8=
X-MS-TrafficTypeDiagnostic: DB6PR0801MB2054:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=vsementsov@virtuozzo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0801MB2054;
	20:x9EXvFHBoMCVHTnNvZrHiWDrXnRVEW7JgB74PT5ginuFY1Xqmgj0Z+nC2BZxxdgVXSR7Ii1hp6pm+cbJwVqDux5XFvXkhQ6B0eGV0YleswgZRMHZpYXvBlkOX76AcEUYaRwiwCAxmdMqN5Bq9tzWUQi3DEwct4GFz9BlR95cCorIPgkkFXP8AhYEA7DJkKTPvU+bYQHSxGNzUWl+A3zpv1rLO+BGwYVxxwwnLetBAl99zabeztg4UjmTXSIOZO5W2ZgTLZ7HxBtl8ZHJSP5rSTGawTaEhdVSQTZecvd3p9dFlQLKe3yr2fdYWo1/eb4vx38HQ02PQk9G9K7BZNREE20nfUdrWP0Ilbm3AcgwsFbOZK8brLRo1ClisLwlSlFdpAy68zcrlMxHH9vh+9ZFgC8FJiXn40T9Weh4KTIdpFk=;
	4:Ci9NK2GzrcSyu9TsuL4r+sVWDyK8pddkhZvBn2GwKzJxWb28LEdgPbbdXTfM2p+NH1NP5JlotKa7bmvohSOo9ekN9/VyCx6s/op34ncxaSqAOkFwjxl9YJ9gZZW5rOpRdH1o+HlenLtjdM7D7pGefQ0ilFeqjA9vUfbLiXgoA6oLC/44SucoV5EICIzGd3Qj27gRp0lC50x05hzOBDShpPGzQ6GsnRAOszFLo6XwSooK1phTQ6KgtOnYzIH4aKWAj2UPCJy9yP8K2vz8tVSgt/NR15a0DQv0Os09fTWzfZoEb/FH+6zInMEjBGYzcbQz
X-Microsoft-Antispam-PRVS: <DB6PR0801MB20548DC29D5ECE9566E413F5C12E0@DB6PR0801MB2054.eurprd08.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(20161123558100)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0801MB2054; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0801MB2054; 
X-Forefront-PRVS: 0493852DA9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(6049001)(346002)(376002)(189002)(199003)(24454002)(65826007)(31686004)(33646002)(81156014)(6666003)(3846002)(66066001)(316002)(53936002)(65806001)(67846002)(23676003)(6246003)(47776003)(4326008)(305945005)(50986999)(54356999)(97736004)(81166006)(8676002)(6116002)(2950100002)(65956001)(8936002)(16576012)(230700001)(76176999)(478600001)(25786009)(50466002)(77096006)(2906002)(86362001)(58126008)(16526018)(64126003)(6486002)(106356001)(7736002)(83506002)(36756003)(189998001)(5660300001)(101416001)(68736007)(31696002)(229853002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR0801MB2054;
	H:[172.16.24.243]; FPR:; SPF:None; PTR:InfoNoRecords; MX:1; A:1;
	LANG:en; 
Received-SPF: None (protection.outlook.com: virtuozzo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtEQjZQUjA4MDFNQjIwNTQ7MjM6YkV2UHZHY05MUFZCUW4xcFpNdGdwRmYy?=
	=?utf-8?B?R1czRG0wZ0VTbE9VczU3dGdLWStFbXB2b0lxcEtBV1ZTb1NzWTIwTEhpSDFB?=
	=?utf-8?B?WXNBdFNYNXpFYWdlQmx0RDFLaXZKeXR4Z0F3dGFMeko1L2pFY1BCanYzOEtm?=
	=?utf-8?B?L0Nta1grdldLdEdRQXdXSVhuQWx3WUpETjFKeUdtMlFKUWJwWXVYWStNL0FR?=
	=?utf-8?B?ZnpMR2x1cGIwMWt6WXpPbTlyamFVYzViMG5tTFJTUGRHWGJXT1pDdDJUZGx3?=
	=?utf-8?B?ODJULyt0VlJjNVRuay85NkZEUXVVaWxVRGhKbDZDV1daajZLeDBSdmhFeXZL?=
	=?utf-8?B?NWQxQXNoT1dHcndxZ2loUmx5MGM4bzFqa0ZUZFJYWTl0UldrV0tTVUJabWtW?=
	=?utf-8?B?R0U0UWRjVDFia2xzYmZkeCtBZ1docjhjYm5zTXJiNURFNU9zZFp3aGtJRkcz?=
	=?utf-8?B?ZTM2bHhSR0R1eWlMQUM4eUxySUlVK2k5bGVmUk94RGZZdTBWZzNTVElFdU9p?=
	=?utf-8?B?NHRUS2pCT1BmU2d3M0IxUEt4b2VQWngrUmJJUUlwbisra3d4c0pGejJUbS8x?=
	=?utf-8?B?SEN0QTNoQ29XZnV1TkNYV28wUS9XUnJSNi9CMmpYcitwV09WeUF3dXpkSXd1?=
	=?utf-8?B?RWNDYU0vdVc0SkNLZjJyY0YxOXRQNzhaZ2dsZ2wyU0JJS0dRaXRMcXY4cVdz?=
	=?utf-8?B?MkJIU3Fndy83cHNFakZ0Znd0ZGtkUlV0MXlnUk9rcXplU0R4QmlQekF1Y3g4?=
	=?utf-8?B?N1lSdXVVbmpMc1JlNGljM1EzbWV4QkJ1UU5WWVpqTk1pSjhETTdvQWt4OFBr?=
	=?utf-8?B?MGtWRnRoaGU0K3g1akNXTlRleFkwd2dvN0Z4UDRMQks0VTdTWVY4U01GTlVy?=
	=?utf-8?B?bTJIcjZ2Q2dkaitFR2Y4blM5aVBqeHFhRXUvaG95bVB0US9wNUIxZFdQRndC?=
	=?utf-8?B?Q0pDSGpmSW5KOXI3azBsK3M2ZjFGNGU2bzJucDEzR29IeGRvOGZ6cjNkRDZM?=
	=?utf-8?B?QzF1eTgvdkI3N29QcGNMTWFnb1ZHK1NkOHVEbndnNWVoYk0vRkgwN2MrYXRj?=
	=?utf-8?B?M3VicUdSMU14YXFFK05DQkpUdFJoUG43K1hwVXN1a3h2emZGMmoxeE1ZSXNQ?=
	=?utf-8?B?MDYwZHEyb25PTVd6ZHJDQ2hzWU01T2FobzBJcHZHK3dDVXpqWC9yU0ovbFBR?=
	=?utf-8?B?U0ZDQlZ5WmY5TFFTd1lYSDkrZDMzdTVjbkF2VzFsckRrMm9KMVdKYmhaUGp3?=
	=?utf-8?B?R0VFTUNJTzJ4djB5V1ZGdkpHN3JhTUFSdGE4UWY5dFM0NE5qNzlRWFJ2VzIw?=
	=?utf-8?B?SGZLVEM2T1dGMFM5d0E3QjE2aWRiSFhvWklMOHZTb2dhazd2eXFsMTlUdmR4?=
	=?utf-8?B?ano5S3NjYlFKS2VYMWE1cDVWSHc5NlhEUzllWW5QcTlSWmczOVcyMUtPdjNI?=
	=?utf-8?B?ZjBJUDRoMlczTlJwTWwzREtmRTRKbFVRdHczVllGMTFDSUl4TmJySFI1QzdD?=
	=?utf-8?B?QnlWcUFZM0Qxc2N5QjRzQjlmVzRoWVB0ZExHaTFxcDcvdFYwSUZqY0JjTndS?=
	=?utf-8?B?MnNoWmR2enNEYTFwY3B1QytSMHpMMVpoRWpINXZ0czJuZW0xM3pFNG9aQ0ZX?=
	=?utf-8?B?dEJFOW82MWZleGJsa2ZpUkJLRWwxcWNvbEN4ajA5WG9IT0UvRmo0K0lUWEYv?=
	=?utf-8?B?UFdhVHFJN3JxNU1YaTdhd1hhbitWK2VKL1Z6OVliV3FBa01uMXJNeTlwcitl?=
	=?utf-8?B?akg5YjliN1loL05WNzVWdUxBPT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0801MB2054;
	6:3OP/pWJ4p18mBUJwd7kyneZoJYDNdz3YZdvqcVIpCjCDaerpd+jqYA/7kHyYt2RJgvz/Bla58j5ZhIEiU6U/IoPg0PLUNrbdSjKyyF7iJZEVPM25RPcONtdQBAuLuE63/cMSbBNuOBlS45WD2GtaR+7qd1Ve1OKb1CGL8yrMDXJMVf2JRocYJh8Gxxd6AW1Bnc7AiUtnwy2R01L6QMEZ0O9xOLJql7DbxVdMCtqPWQJQqtPOX80Qp3VjxOaDGoIRcDNPx5yiwVRrQPsyljONwFlJHUdt3U8u6CmdD7uSOLzRx/pLF6MJJJVdbbKTgIre1csyLluTdWWbnSj2SF9dDVOOan0RzemKyk40yljwU9A=;
	5:5bAWkuNmgDJBNatIXk4qdZgQX9UKVsByg6vLGhbpMZj/HUO3LjtK3dSSEsY7n78zLCYfhMedtktP3Kc8sADMDmdGrpwWX13Sw1QqEKzOd/yG2ZMwSTQDofULCM8G9V7xivnrcaFQjq3aR4LzbtCTq5K/A3P0vOWX69+WYc7dhVY=;
	24:KWkZWv/5RlYhbW5ChC5Ggf2KoAMyU7qup6yfNO/g8LvUV3xKLwNcRrjWJ+2K+sy8KihGQfb9RfPxqhmTGVoy9FeTPvLGeZzcJRzBThNpF6k=;
	7:9ynRY7uSX+rIdwGG8Ab1PlogVN13H2P7Xw6Qwr3G/NelYZnDPP2g2R2RWiEl/GRkmbVX7iNHBrlSzRiVP5C6G8O8cUrNlrPg711JxLwVA2aQwkRs3oc39taDvsvLmhUKw62z7yEwtl3cxFLKH8dd1gwccnVHH85anmgpcgiWWytmFfNrQMU+f9WUCrP7QWS4jIxw7q6a8/brRtC4dd/yjg2xK0EwrHf9G88Enyin4aP4yKOHj5/u6ZZZfCg75kWX
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DB6PR0801MB2054;
	20:ZYpVEfa6n+8Or4zxwEMkCu3sS42KV0EqSfD/Q4r1ocpOUBbs6Tbf+QBKOslkWwrf/C45CAKcNNVrxnwyVWKydphHgyS/Of9c+Se5sceWh11uzlUykp/34FxHYyHAFn97P/ztVJOt8Q2A41Bvez0G+aZN+qjJMtgI0MxSnrZMBoc=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2017 07:33:52.9368 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb6c695-c914-4f2d-99c1-08d52cc4637d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2054
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.105
X-Mailman-Approved-At: Thu, 16 Nov 2017 09:50:07 -0500
Subject: Re: [Qemu-trivial] [PATCH for-2.11] nbd/client: Don't
 hard-disconnect on ESHUTDOWN from server
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
X-List-Received-Date: Thu, 16 Nov 2017 07:34:01 -0000

13.11.2017 22:48, Eric Blake wrote:
> The NBD spec says that a server may fail any transmission request
> with ESHUTDOWN when it is apparent that no further request from
> the client can be successfully honored.  The client is supposed
> to then initiate a soft shutdown (wait for all remaining in-flight
> requests to be answered, then send NBD_CMD_DISC).  However, since
> qemu's server never uses ESHUTDOWN errors, this code was mostly
> untested since its introduction in commit b6f5d3b5.
>
> More recently, I learned that nbdkit as the NBD server is able to
> send ESHUTDOWN errors, so I finally tested this code, and noticed
> that our client was special-casing ESHUTDOWN to cause a hard
> shutdown (immediate disconnect, with no NBD_CMD_DISC), but only
> if the server sends this error as a simple reply.  Further
> investigation found that commit d2febedb introduced a regression
> where structured replies behave differently than simple replies -
> but that the structured reply behavior is more in line with the
> spec (even if we still lack code in nbd-client.c to properly quit
> sending further requests).  So this patch reverts the portion of
> b6f5d3b5 that introduced an improper hard-disconnect special-case
> at the lower level, and leaves the future enhancement of a nicer
> soft-disconnect at the higher level for another day.
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

> ---
>   nbd/client.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/nbd/client.c b/nbd/client.c
> index 4e15fc484d..eea236ca06 100644
> --- a/nbd/client.c
> +++ b/nbd/client.c
> @@ -996,15 +996,9 @@ int nbd_receive_reply(QIOChannel *ioc, NBDReply *reply, Error **errp)
>           if (ret < 0) {
>               break;
>           }
> -
>           trace_nbd_receive_simple_reply(reply->simple.error,
>                                          nbd_err_lookup(reply->simple.error),
>                                          reply->handle);
> -        if (reply->simple.error == NBD_ESHUTDOWN) {
> -            /* This works even on mingw which lacks a native ESHUTDOWN */
> -            error_setg(errp, "server shutting down");
> -            return -EINVAL;
> -        }
>           break;
>       case NBD_STRUCTURED_REPLY_MAGIC:
>           ret = nbd_receive_structured_reply_chunk(ioc, &reply->structured, errp);


-- 
Best regards,
Vladimir


