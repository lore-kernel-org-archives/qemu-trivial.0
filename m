Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4hpo-0006sX-D3
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2022 07:23:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p4hpn-0006rZ-IY
 for qemu-trivial@nongnu.org; Mon, 12 Dec 2022 07:23:03 -0500
Received: from mail-db8eur05on2110.outbound.protection.outlook.com
 ([40.107.20.110] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.drobyshev@virtuozzo.com>)
 id 1p4hpl-0008GM-MB
 for qemu-trivial@nongnu.org; Mon, 12 Dec 2022 07:23:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPPMxMBdfl+g3BSCKaqax/gfW6jhgQ/mPsJVKKRMhY64VSdZHW20LGrrKx5mtddGNBx0f3+Z5qp4WIsm4MggQndovGd3FB0VUi4xjloWea0j24x+MhUlE61RpedTCiEth+yWBhJ7pLJ+ux9tXuYDkcqDtlhHMfcJLSUIdtqnlW8ELnYWEy/14uC/jY+/h6zdBp5ZZyIB+6XSPnf0zNNAtdVt4/i7WBzGnAEhDVRiYrcXsJ77dYNlo2PCkVI0KOCQ2qX1TvGqf8jWdKexBy5CUE5dHLJW6+KX2jaRD170jMr9Bj7Ef0tVZtG5/UHqoJPOrV+PneFh4ZUZ6zU5ETnAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4FdA7pJj2uXzUWXWfzX+qTakZSww45DRGamygZcN7o=;
 b=Tfwmup3rvOwq+3j1vM9km3+9irjYNZqodyv6Bhv+Inkmp7tyNuKCvPy1KJGqGCb7mP8gDByier/k115wzrFNVdQAKB0ujK98M1xb9Xy/UVzAx3sQ1RYrUE2GuQkSl8qVA7DHn2j46BiyjsQIcksLLxmmbB80woy6VxrexD7NOUO69zvRHmuqJ2olZ95gQIr6w0LDJZuUi9aISH/nJMTkBemzePPmUXop168y4QmV141GzvsDECfHQ1D3UVchDJvWMiMJ9rsGrp62IxpoRo2i37pe+Kn2TyTysaevb3SSWOkOiieqIvFJMngxic6/mgB1F6WVT/gGD5X2gAVbh00wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4FdA7pJj2uXzUWXWfzX+qTakZSww45DRGamygZcN7o=;
 b=N7awrVVkfssSjxLp61FpDxiIKt2EvHaLtlqgXc4i3L1x5zbcE07PSV42LpXy5tGEp6nS0uMTQDlZ052ZlLMzqh6ybW082kRu1BtsmNR/NlMy5yjRU7WMQDKLaeJmxtvCRZJxaCntegPs0DNFVmVpyvPYJ2dFyGpaDqPfalwamBxPKbKzEH+O3GGP+Y+kE1DK3Qz6ijA3l5m2rVV03Z8I6gNFrwMPY1r/Uq7A8GcsVSbeunKiZkCIJNVGg009z9Wmt8GzNszW5JOW94K7SSUUrgslmEltBljhW8UBq4QW+W7w5wJNZYx+dPfMSM0XwfX/9cNiyG54kqtNyLzrgqSABQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com (2603:10a6:205:e::33)
 by DB3PR08MB9086.eurprd08.prod.outlook.com (2603:10a6:10:430::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.8; Mon, 12 Dec
 2022 12:22:57 +0000
Received: from AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156]) by AM4PR08MB2932.eurprd08.prod.outlook.com
 ([fe80::d342:b36a:8ff5:8156%3]) with mapi id 15.20.5924.008; Mon, 12 Dec 2022
 12:22:57 +0000
Message-ID: <4b6c5e90-4240-95c3-c27c-47fd81d24ae2@virtuozzo.com>
Date: Mon, 12 Dec 2022 14:23:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] qga-win: replace libpcre with libpcre2 in MSI package
Content-Language: en-US
To: qemu-trivial@nongnu.org
Cc: den@virtuozzo.com, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
From: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
In-Reply-To: <20221128130221.389454-1-andrey.drobyshev@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::15) To AM4PR08MB2932.eurprd08.prod.outlook.com
 (2603:10a6:205:e::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PR08MB2932:EE_|DB3PR08MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 96997e80-7ea0-4ee5-7ed2-08dadc3b99ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZCq0Nd6AVNCnicK7s36GxExF+r2s2CNT9WnTHcdbAnHjlku53rWEz6Cd7JCJe5juVONEyU9c0o2QsK8pM/80dHsarHS6XHHXwO4mjTVWVBT6udCq8tK6Hv2ZtgmDweJsbz7+sDgvbo5m1vYKySQQl6zYxcChdUe9MLw4aBekkKuCDF80LkjMcOFoz3x/aYi8bVY2bdmil/EOgv+2GJ6sio0i9tGiMnD2FcccYevwTqkKqN0u1SrcFcJdAOZ70py8SjC3YixO1ye+iJS0OM/3D+yLC1rHHxMf+Nn5aS9i+TBA+3CvIscQVCOxh35OtL7xj7LtoOYUGO4OLpLFEvMCBtcVZMu2DSu/fqzr6gcS1Iyu41Qv2XrUbdBPPD+7Om7hLb6DyHfE78WGejJpqynN7wcuNFCMGCogPFl1qckqKWdxhW6MKzf2jsRHi3HVAqbcpX61/ANWYrzWdWv7kiewUUFoFzQI5AeHq686onS1IqICHSAsOVllWEymWaQ1+jOm4ovOMBa+srBzOuf7Cp+tNPFAdTtzYk1biLMKE7rLE6TEgH3vDiaIxpekK3HmZtVBaYUv3Uc7L8gy5AZGSmCsMHG/XozfB2S+SvH5apcXc4hMj5DIIBwXBFmoKmlx4nYSCa/V6r1+X+CCWvZ8xuL/XWunpe/sCkmN/vm0YSX3m9YlUe4C0EIG0XAv1KuizHJnICnw71uC6BTQCkHpMwZyhIofm6rgOsE8C9qEA2QcSSNAv6bJrRTbj0/YzaBSTWyo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM4PR08MB2932.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39840400004)(396003)(451199015)(86362001)(5660300002)(44832011)(8936002)(38100700002)(4744005)(66556008)(66476007)(66946007)(8676002)(4326008)(41300700001)(2616005)(26005)(6512007)(2906002)(6916009)(54906003)(966005)(31696002)(6486002)(186003)(53546011)(316002)(83380400001)(6506007)(478600001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGVXeXJFRlF3WDlzTFlEZExoVHNpZ3dDUHphYUYyZCtpcklmL1hqVVhHSjNo?=
 =?utf-8?B?TkFLRTBOcDQ1cHZYWWVDU2dacmVOZ0JUZW50LytSNHFpSUJTRUNRbk5peXRl?=
 =?utf-8?B?cms3Wm11ZlF4YjZkR3c2Q0hpLzdZNXduOWJnb3ZtVkpXaDYyV3JTVXF1ZTBk?=
 =?utf-8?B?aWxmZTgyczlsNldDZ3U1MEdKWENuU1RpRitaQU5pNWRiZXFjcnliU2pKR1Za?=
 =?utf-8?B?aTZwRlVORUdyOUpRSWVxV1FKMy9qaXY5ZUlveVhJRXhzb0E3eGFtd1BObVl1?=
 =?utf-8?B?N1dyclRPMzZWSzJ5bkw2d3dWN1ZrdkhPZkVaVWNyUkg0SE93eTFtY05aRkQ5?=
 =?utf-8?B?Z05MY0dPK3BUOE04M2JhZEpJaXlucklXbk1sTklwK0s5WlpTdHBveUsxRCtI?=
 =?utf-8?B?S2JmbUJFQnZ6YlJWMjg5LzljRFE1N2xpeEdpOFVwVEY2N3pPOXpEWGtrL041?=
 =?utf-8?B?RWxOMnFFd1AvVi9xNUNHRXFjK0g3RXgwWHlac2VENWNSUmQ5VVorOUllUng0?=
 =?utf-8?B?M2ZIVGVPOXRGNmVyN0VwdDg3M3ZjZmlKTC9paVdWNVpHNUM0WjVIUWN4VUxR?=
 =?utf-8?B?MnR5bjl1dWtDQ1lEYm9Hc3lzTFhLUU9CWFU3Nm4yMjA2NFplL0c1VUQvNU9M?=
 =?utf-8?B?bC9Pc00vTVBoOHhMSERLdVlSY2pFaVZ1L0hsQ2hxRFdZUERjMWRyZmZtQWVj?=
 =?utf-8?B?QmVFK0hHNnZTWU9NNzBlVkNsaVViWWJSMVI4UExUTFlKZ1NCMkVQTGdnZ01y?=
 =?utf-8?B?QnppeTVJSERqVzBhTXR1QnFtUzYzc1VublMxQnVMQ0RSU1Bnc3dra2tRM3pF?=
 =?utf-8?B?M05wYTB5aXJpU2tvZnN6SmlwZkMvM0plajVTTTh5Mlg0NWhUOFZucXlRZjhL?=
 =?utf-8?B?TGptbTVEaVlFd3AvL3psZWRFM2ZnV2REaElPblNWWjZPbzFwK2V1Vk5US3o0?=
 =?utf-8?B?M0RmWi8zWGd0VU16MGJJTkd6ODNRZWxNY2dLdzlCNjRZSnZTVmFTNzVWaVRy?=
 =?utf-8?B?RjBBQ1E5Uml2K24rMU5RNjlBK0pGZjEzNmJHeU9iYkRNeXB1TXplemF0eThy?=
 =?utf-8?B?WW50THZhbzJrVW5YN2s3S3FObnJCYlI3YkJ5aGtsRHlqN1pnVU84ckN4eThi?=
 =?utf-8?B?NE5KN1FuS3ZRcERoR0hqaE5wYmp5K3J5akFXZWRaVWppOXAyWnBuMmUyRURF?=
 =?utf-8?B?QytZbEJ0c0l6d3NOTHBEbnp1eUNoYklaZVFIRUwveE1rK1FSaDA2a2M3YWN0?=
 =?utf-8?B?L09aQ1dKT25CaEY1WEFTeDZXWHRVZWR6azFBVlNpMHRvZE1TTUhyR1J1c1JL?=
 =?utf-8?B?aUJwSkh6b2IyK2E4WWFEcHVnUndiQ0tobXFNcDVscng3RGpJQ0JwbWVFMUtW?=
 =?utf-8?B?NGVwTzVJdExXRnlIZlpNaElxSW12bUlzeE5VOE5NNUpuODNXSm9reG5zTXJJ?=
 =?utf-8?B?K0c4SHhaU2Jmd1lrQWZzVzRwN01oNXB0WGRBajJLdys5TzlVR291cmRwMGpJ?=
 =?utf-8?B?QkFzbzNxQmcxTmNteDF5bEVKTHp2UVF2cmtZNDRTY01rY1lhZTE3ZVQwK01X?=
 =?utf-8?B?cXZZL3o2NUFxQ2RiSnhIaWJEK3dCUUpyUSt2d0I0R09LdVE1SXE0SE5ZVDNl?=
 =?utf-8?B?dVI1b1ZPY1U0czJ1c24wNkhXZzBGMmJKUG5hRkxLdUxJNXkwb3lBMGU2ZVdz?=
 =?utf-8?B?NVBIYlUxdmovN2RxN0hLcFAvZ21Ta2RIQ3ppdEtleGhhODRVKy85VUdMNFNU?=
 =?utf-8?B?M1VvWVB6dFRVaEJ0VHpOY28yRGh1QWtqbDg2UW82NUpjMVZLVzJFRkYrc2tH?=
 =?utf-8?B?bXNnc1c4K240aVZOSzhieURzTGI1S1RmelBnV3dIM3V2NEsybndyeFIwbWp3?=
 =?utf-8?B?U01oSVA4d2JucWpxN0R1WlZwSzNuTWpHWnBjalpkYzh3K2tKb0x1ZTZhdkRM?=
 =?utf-8?B?bHA4b2ZxYkp3UXRvaGNmV2d3YVJwK24xNkxzd0wxQS84UGVOVllBU2llR29F?=
 =?utf-8?B?a0ZzSHExclJDTVppYkl1YklBMm4rVnFyR0NwSlFRQnZHd1VpRVptVHdWalBR?=
 =?utf-8?B?RS9JWkdRYmxmd0hJWnptNEZQU3VvNzIyS2lBVGRWREtzS0tRQ2dMcGdOZ1VT?=
 =?utf-8?B?Qnc4UTQzY3I2N2xIRkJmRUxWNDF5SnFiOGtUTW01dWtwOXpWTExxR3pLcVpJ?=
 =?utf-8?B?OHc9PQ==?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96997e80-7ea0-4ee5-7ed2-08dadc3b99ee
X-MS-Exchange-CrossTenant-AuthSource: AM4PR08MB2932.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 12:22:57.1946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcZHMqYtJkvG3WABWe8rqfYkAySb4vUNNP7eWtyXc9nFJFeS1kG0I3/OTzJf+9zvCxmrpOV9ZxticAJ766WLMjP7NZsPU0+gCF5/4ZPZwik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9086
Received-SPF: pass client-ip=40.107.20.110;
 envelope-from=andrey.drobyshev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 12 Dec 2022 12:23:03 -0000

On 11/28/22 15:02, Andrey Drobyshev wrote:
> According to GLib changelog [1], since version 2.73.2 GLib is using
> libpcre2 instead of libpcre.  As a result, qemu-ga MSI installation
> fails due to missing DLL.
> 
> This commit makes wixl to put libpcre2-8-0.dll into the MSI bundle.
> 
> [1] https://gitlab.gnome.org/GNOME/glib/-/releases#2.73.2
> 
> Signed-off-by: Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>
> ---
>  qga/installer/qemu-ga.wxs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> [...]

Ping

